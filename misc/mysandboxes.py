#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
mysandboxes.py - Pywikibot Sandbox Reset Bot

This script automatically resets user sandbox pages on Wikimedia wikis to a
clean state with predefined template content. It supports multiple wikis
(Commons, Meta, English Wikipedia, Esperanto Wikipedia, Simple English
Wikipedia, and Scots Wikipedia) and can run continuously on a schedule.

Originally based on the Pywikibot clean_sandbox script from 2006-2014,
modernized and customized for AvicBot in 2026.

Features:
    - Multi-wiki support with per-wiki configuration
    - Configurable delay between cleanings to respect recent edits
    - Support for both one-shot and continuous operation modes
    - Handles redirects and edit conflicts gracefully

Requirements:
    - Python 3.10+
    - Pywikibot 9.x+
    - Valid user-config.py for Pywikibot authentication

Usage:
    Basic usage (one-shot, default wiki):
        python mysandboxes.py

    Run continuously every 2 hours:
        python mysandboxes.py -hours:2

    Use a 10-minute delay after last edit:
        python mysandboxes.py -delay:10

    Custom replacement text:
        python mysandboxes.py -text:"{{sandbox-heading}}"

    Custom edit summary:
        python mysandboxes.py -summary:"Cleaning sandbox"

    Target specific wiki:
        python mysandboxes.py -family:wikipedia -lang:en

Command-line Arguments:
    -hours:#    Run continuously, repeating every # hours
                (Decimal values supported: 0.5 = 30 minutes)

    -delay:#    Minimum minutes to wait after last edit before cleaning
                (Default: calculated from hours, clamped to 5-15 minutes)
                (Minimum: 5 minutes)

    -text:      Custom text to use for sandbox reset
                (If not provided, uses predefined content for current wiki)

    -summary:   Custom edit summary for the reset
                (If not provided, uses translated default message)

Authors:
    - Leonardo Gregianin (2006)
    - Wikipedian (2006-2007)
    - Andre Engels (2007)
    - Siebrand Mazeland (2007)
    - xqt (2009-2014)
    - Dr. Trigon (2012)
    - Pywikibot team (2012-2014)
    - Léon "Avic" Simmons (2014, 2026 modernization)

License: MIT License
"""

from __future__ import annotations

import time
from dataclasses import dataclass, field
from datetime import datetime, timedelta, timezone
from typing import TYPE_CHECKING

# =============================================================================
# Pywikibot imports
# These are the core libraries for interacting with MediaWiki wikis
# =============================================================================
import pywikibot
from pywikibot import i18n, pagegenerators
from pywikibot.bot import SingleSiteBot

if TYPE_CHECKING:
    from collections.abc import Iterator
    from pywikibot.page import BasePage

# =============================================================================
# CONFIGURATION: Sandbox Content Templates
# =============================================================================
# Define the standard content that each sandbox should be reset to.
# The key is the wiki code (e.g., 'en' for English Wikipedia).
# The value is the wikitext content including any templates and headings.
# =============================================================================

SANDBOX_CONTENT: dict[str, str] = {
    "commons": "{{User:Avicennasis/sandboxnotice}}\n==Test below here==",
    "meta": "{{User:Avicennasis/sandboxnotice}}\n==Test below here==",
    "en": "{{User:Avicennasis/sandboxnotice}}\n==Test below here==",
    "eo": "{{Uzanto:Avicennasis/sandboxnotice}}\n==Test below here==",
    "simple": "{{User:Avicennasis/sandboxnotice}}\n==Test below here==",
    "sco": "{{User:Avicennasis/sandboxnotice}}\n==Test below here==",
}

# =============================================================================
# CONFIGURATION: Sandbox Page Titles
# =============================================================================
# Define the list of sandbox pages to manage on each wiki.
# Uses a helper function to generate the standard numbered sandbox pattern.
# =============================================================================


def _generate_sandbox_titles(
    user_prefix: str = "User",
    user_talk_prefix: str = "User talk",
    username: str = "Avicennasis",
    max_sandboxes: int = 10,
) -> list[str]:
    """
    Generate a list of sandbox page titles for a user.

    Creates titles for both User: and User talk: namespaces, with numbered
    sandboxes from 1 to max_sandboxes.

    Args:
        user_prefix: Localized "User" namespace name
        user_talk_prefix: Localized "User talk" namespace name
        username: The username whose sandboxes to manage
        max_sandboxes: Number of numbered sandboxes (2 through max)

    Returns:
        List of page titles covering all sandbox pages
    """
    titles: list[str] = []

    # Generate User talk: namespace sandboxes
    titles.append(f"{user_talk_prefix}:{username}/sandbox")
    for i in range(2, max_sandboxes + 1):
        titles.append(f"{user_talk_prefix}:{username}/sandbox{i}")

    # Generate User: namespace sandboxes
    titles.append(f"{user_prefix}:{username}/sandbox")
    for i in range(2, max_sandboxes + 1):
        titles.append(f"{user_prefix}:{username}/sandbox{i}")

    return titles


# Standard English sandbox titles (reused across most wikis)
_ENGLISH_SANDBOXES = _generate_sandbox_titles()

# Esperanto uses different namespace names
_ESPERANTO_SANDBOXES = _generate_sandbox_titles(
    user_prefix="Uzanto",
    user_talk_prefix="Uzanto-Diskuto",
)

SANDBOX_TITLES: dict[str, list[str]] = {
    "commons": _ENGLISH_SANDBOXES,
    "meta": _ENGLISH_SANDBOXES,
    "en": _ENGLISH_SANDBOXES,
    "eo": _ESPERANTO_SANDBOXES,
    "simple": _ENGLISH_SANDBOXES,
    "sco": _ENGLISH_SANDBOXES,
}


# =============================================================================
# Bot Configuration Dataclass
# =============================================================================
@dataclass
class SandboxBotConfig:
    """
    Configuration options for the SandboxBot.

    Attributes:
        hours: Interval in hours between cleaning cycles (default: 1.0)
        no_repeat: If True, run once and exit (default: True)
        delay_minutes: Minutes to wait after last edit before cleaning
                      (minimum 5, default: calculated from hours)
        text: Custom text to reset sandboxes to (overrides wiki defaults)
        summary: Custom edit summary (overrides translated default)
    """

    hours: float = 1.0
    no_repeat: bool = True
    delay_minutes: int | None = None
    text: str = ""
    summary: str = ""

    # Computed field: actual delay as timedelta
    _delay_td: timedelta = field(init=False, repr=False)

    def __post_init__(self) -> None:
        """Calculate the actual delay timedelta after initialization."""
        if self.delay_minutes is None:
            # Default: calculate from hours, clamped to 5-15 minutes
            calculated = int(self.hours * 60)
            self.delay_minutes = max(5, min(15, calculated))
        else:
            # Ensure minimum of 5 minutes
            self.delay_minutes = max(5, self.delay_minutes)

        self._delay_td = timedelta(minutes=self.delay_minutes)

    @property
    def delay_timedelta(self) -> timedelta:
        """Get the delay as a timedelta object."""
        return self._delay_td


# =============================================================================
# Main Bot Class
# =============================================================================
class SandboxBot(SingleSiteBot):
    """
    A Pywikibot bot that resets sandbox pages to their default content.

    This bot connects to a MediaWiki wiki and periodically cleans user sandbox
    pages by resetting them to predefined template content. It respects a
    configurable delay period after the last edit to avoid immediately
    overwriting active experimentation.

    Attributes:
        config: SandboxBotConfig instance with runtime options
        generator: Iterator of Page objects to process
    """

    # Opt-in to the Pywikibot bot framework's page generator handling
    use_redirects = False  # Process redirect pages normally (don't follow them)

    def __init__(
        self,
        config: SandboxBotConfig,
        generator: Iterator[BasePage] | None = None,
        **kwargs,
    ) -> None:
        """
        Initialize the SandboxBot.

        Args:
            config: Bot configuration options
            generator: Optional page generator; if None, uses wiki-specific defaults
            **kwargs: Additional arguments passed to parent class
        """
        # Initialize the parent class with the site
        super().__init__(**kwargs)

        self.config = config

        # Validate that we have content for this wiki
        wiki_code = self.site.code
        if wiki_code not in SANDBOX_CONTENT and not config.text:
            pywikibot.error(
                f"No default content defined for {wiki_code}, "
                f"and no -text argument provided. Exiting."
            )
            raise RuntimeError(f"No content for wiki: {wiki_code}")

        # Set up the page generator
        if generator:
            self.generator = generator
        else:
            # Use default sandbox titles for this wiki
            if wiki_code not in SANDBOX_TITLES:
                pywikibot.error(
                    f"No sandbox titles defined for {wiki_code}. Exiting."
                )
                raise RuntimeError(f"No sandbox titles for wiki: {wiki_code}")

            # Create Page objects for each sandbox title
            self.generator = [
                pywikibot.Page(self.site, title)
                for title in SANDBOX_TITLES[wiki_code]
            ]

    def _get_clean_content(self) -> str:
        """
        Get the clean sandbox content for the current wiki.

        Returns:
            The wikitext content to reset sandboxes to
        """
        # Custom text takes precedence over wiki defaults
        if self.config.text:
            return self.config.text

        # Use the predefined content for this wiki
        return SANDBOX_CONTENT.get(self.site.code, "")

    def _get_edit_summary(self) -> str:
        """
        Get the edit summary for sandbox resets.

        Returns:
            The edit summary text
        """
        # Custom summary takes precedence
        if self.config.summary:
            return self.config.summary

        # Use Pywikibot's translated message system
        return i18n.twtranslate(self.site, "clean_sandbox-cleaned")

    def _should_clean_page(
        self,
        page: BasePage,
        clean_content: str,
    ) -> tuple[bool, str | None]:
        """
        Determine if a sandbox page needs to be cleaned.

        This method checks:
        1. If the page already has the clean content (no action needed)
        2. If we need to wait due to recent edits
        3. If the page is using substituted templates

        Args:
            page: The Page object to check
            clean_content: The expected clean content

        Returns:
            Tuple of (should_clean: bool, wait_message: str | None)
            If should_clean is False and wait_message is not None,
            the caller should wait and retry.
        """
        current_text = page.text.strip()
        expected_text = clean_content.strip()

        # Check if already clean
        if current_text == expected_text:
            pywikibot.output("  → Sandbox is already clean, no change needed.")
            return False, None

        # Check for substitution (subst:) in content
        uses_subst = "subst:" in clean_content

        if uses_subst and page.latest_revision.user == self.site.user():
            # Bot made the last edit with substituted content - likely clean
            pywikibot.output(
                "  → Sandbox may be clean (substituted content by bot). "
                "Skipping."
            )
            return False, None

        # Check if content starts with expected text (may have additions below)
        if not uses_subst and current_text.startswith(expected_text):
            # Content was potentially just extended, check edit time
            pass  # Fall through to time check

        # Check the time since last edit
        if page.latest_revision.timestamp:
            # Calculate time since last edit
            edit_time = page.latest_revision.timestamp
            now = pywikibot.Timestamp.now(tz=timezone.utc)
            edit_delta = now - edit_time

            # How long until we can clean?
            remaining = self.config.delay_timedelta - edit_delta

            if remaining > timedelta(0):
                # Still within the delay window
                minutes_ago = edit_delta.total_seconds() / 60
                wait_seconds = int(remaining.total_seconds())
                pywikibot.output(
                    f"  → Sandbox was edited {minutes_ago:.1f} minutes ago. "
                    f"Waiting {wait_seconds // 60} minutes."
                )
                return False, f"wait:{wait_seconds}"

        # Page needs cleaning and delay has passed
        return True, None

    def _process_single_page(self, page: BasePage) -> bool:
        """
        Process a single sandbox page.

        Args:
            page: The Page object to process

        Returns:
            True if we should wait before processing more pages
        """
        pywikibot.output(f"\nProcessing: {page.title(as_link=True)}")

        # Handle redirect pages
        if page.isRedirectPage():
            pywikibot.warning(
                f"  {page.title(as_link=True)} is a redirect. "
                f"Cleaning it anyway."
            )

        try:
            # Get the content we want to set
            clean_content = self._get_clean_content()
            edit_summary = self._get_edit_summary()

            # Determine if cleaning is needed
            should_clean, wait_info = self._should_clean_page(page, clean_content)

            if wait_info and wait_info.startswith("wait:"):
                # Extract wait time and sleep
                wait_seconds = int(wait_info.split(":")[1])
                time.sleep(wait_seconds)
                return True  # Signal that we waited

            if should_clean:
                # Show diff and save
                old_text = page.text
                page.text = clean_content
                pywikibot.showDiff(old_text, clean_content)
                page.save(summary=edit_summary)
                pywikibot.output("  ✓ Sandbox cleaned successfully.")

        except pywikibot.exceptions.EditConflictError:
            pywikibot.warning("  Edit conflict! Will retry on next cycle.")

        except pywikibot.exceptions.NoPageError:
            pywikibot.warning(f"  Page {page.title()} does not exist. Skipping.")

        except pywikibot.exceptions.LockedPageError:
            pywikibot.error(f"  Page {page.title()} is protected. Skipping.")

        return False

    def run(self) -> None:
        """
        Main bot run loop.

        Processes all sandbox pages in the generator. If no_repeat is False,
        continues running on the configured schedule.
        """
        # Ensure we're logged in
        self.site.login()

        pywikibot.output("=" * 60)
        pywikibot.output("AvicBot Sandbox Reset Bot")
        pywikibot.output(f"Wiki: {self.site}")
        pywikibot.output(f"Mode: {'One-shot' if self.config.no_repeat else 'Continuous'}")
        if not self.config.no_repeat:
            pywikibot.output(f"Interval: {self.config.hours} hours")
        pywikibot.output(f"Edit delay: {self.config.delay_minutes} minutes")
        pywikibot.output("=" * 60)

        while True:
            # Get current time for logging
            now = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M:%S UTC")
            pywikibot.output(f"\n--- Starting cycle at {now} ---")

            waited = False

            # Process each sandbox page
            # Convert generator to list to allow re-iteration
            pages = list(self.generator)
            for page in pages:
                if self._process_single_page(page):
                    waited = True

            # Check if we should repeat
            if self.config.no_repeat:
                pywikibot.output("\n✓ Done (one-shot mode).")
                return

            # Sleep until next cycle (if we didn't wait during processing)
            if not waited:
                sleep_seconds = self.config.hours * 3600
                if self.config.hours < 1.0:
                    pywikibot.output(
                        f"\nSleeping {self.config.hours * 60:.0f} minutes "
                        f"until next cycle..."
                    )
                else:
                    pywikibot.output(
                        f"\nSleeping {self.config.hours:.1f} hours "
                        f"until next cycle..."
                    )
                time.sleep(sleep_seconds)


# =============================================================================
# Command-line Argument Parsing
# =============================================================================
def parse_arguments(args: list[str]) -> tuple[SandboxBotConfig, list[BasePage] | None]:
    """
    Parse command-line arguments into configuration.

    Args:
        args: Command-line arguments (typically sys.argv[1:])

    Returns:
        Tuple of (config, generator) where generator may be None to use defaults
    """
    # Let Pywikibot handle its standard arguments
    local_args = pywikibot.handle_args(args)

    # Initialize configuration values
    hours: float = 1.0
    no_repeat: bool = True
    delay: int | None = None
    text: str = ""
    summary: str = ""

    # Create a generator factory for handling page-related arguments
    gen_factory = pagegenerators.GeneratorFactory()

    # Parse our custom arguments
    for arg in local_args:
        if arg.startswith("-hours:"):
            # Extract hours value (float supported)
            hours = float(arg[7:])
            no_repeat = False  # -hours implies continuous mode
            pywikibot.output(f"Continuous mode: every {hours} hours")

        elif arg.startswith("-delay:"):
            # Extract delay in minutes
            delay = int(arg[7:])
            pywikibot.output(f"Edit delay set to {delay} minutes")

        elif arg.startswith("-text"):
            # Handle -text:value or -text (prompts for input)
            if len(arg) == 5:
                text = pywikibot.input("Enter the sandbox reset text:")
            else:
                text = arg[6:]

        elif arg.startswith("-summary"):
            # Handle -summary:value or -summary (prompts for input)
            if len(arg) == 8:
                summary = pywikibot.input("Enter the edit summary:")
            else:
                summary = arg[9:]

        else:
            # Let the generator factory try to handle it
            gen_factory.handle_arg(arg)

    # Create configuration object
    config = SandboxBotConfig(
        hours=hours,
        no_repeat=no_repeat,
        delay_minutes=delay,
        text=text,
        summary=summary,
    )

    # Try to get a page generator from factory
    generator = gen_factory.getCombinedGenerator()

    return config, generator


# =============================================================================
# Main Entry Point
# =============================================================================
def main(*args: str) -> None:
    """
    Main entry point for the sandbox reset bot.

    This function:
    1. Parses command-line arguments
    2. Creates the bot configuration
    3. Initializes and runs the bot

    Args:
        *args: Command-line arguments. If empty, sys.argv is used.
    """
    # Parse arguments
    config, generator = parse_arguments(list(args) if args else [])

    # Create and run the bot
    bot = SandboxBot(config=config, generator=generator)
    bot.run()


# =============================================================================
# Script Entry Point
# =============================================================================
if __name__ == "__main__":
    main()
