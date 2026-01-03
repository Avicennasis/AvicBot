#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
allfine.py - Status Notification Bot

This script posts a status update to X (formerly Twitter) indicating that all
systems are operational. It can be scheduled via cron or task scheduler to
provide regular heartbeat notifications.

Originally written in 2014, modernized for 2026.

Requirements:
    - tweepy: Modern Python library for the Twitter/X API v2
      Install via: pip install tweepy
    - API credentials from the X Developer Portal
      (https://developer.twitter.com/)

Usage:
    Set the required environment variables before running:
        X_CONSUMER_KEY        - Your API/Consumer key
        X_CONSUMER_SECRET     - Your API/Consumer secret
        X_ACCESS_TOKEN        - Your Access token
        X_ACCESS_TOKEN_SECRET - Your Access token secret

    Then run:
        python allfine.py

Author: Léon "Avic" Simmons
License: MIT License
"""

import os
import sys
from datetime import datetime, timezone
from typing import NoReturn

# =============================================================================
# Attempt to import the tweepy library for X/Twitter API access.
# If not installed, provide a helpful error message to the user.
# =============================================================================
try:
    import tweepy
except ImportError as e:
    print("Error: The 'tweepy' library is required but not installed.")
    print("Please install it using: pip install tweepy")
    sys.exit(1)


def get_api_credentials() -> dict[str, str]:
    """
    Retrieve X/Twitter API credentials from environment variables.

    This approach keeps sensitive credentials out of the source code,
    following security best practices.

    Returns:
        dict[str, str]: Dictionary containing the four required API credentials.

    Raises:
        SystemExit: If any required environment variable is not set.
    """
    # Define the required environment variable names
    required_vars = [
        "X_CONSUMER_KEY",
        "X_CONSUMER_SECRET",
        "X_ACCESS_TOKEN",
        "X_ACCESS_TOKEN_SECRET",
    ]

    # Collect credentials from environment
    credentials = {}
    missing_vars = []

    for var in required_vars:
        value = os.environ.get(var)
        if value is None:
            missing_vars.append(var)
        else:
            credentials[var] = value

    # If any credentials are missing, report and exit
    if missing_vars:
        print("Error: The following environment variables are not set:")
        for var in missing_vars:
            print(f"  - {var}")
        print("\nPlease set these variables with your X/Twitter API credentials.")
        sys.exit(1)

    return credentials


def create_twitter_client(credentials: dict[str, str]) -> tweepy.Client:
    """
    Create and return an authenticated X/Twitter API v2 client.

    Args:
        credentials: Dictionary containing the API credentials:
            - X_CONSUMER_KEY
            - X_CONSUMER_SECRET
            - X_ACCESS_TOKEN
            - X_ACCESS_TOKEN_SECRET

    Returns:
        tweepy.Client: Authenticated client ready to make API calls.
    """
    # Create the client using OAuth 1.0a User Context authentication
    # This allows posting tweets on behalf of the authenticated user
    client = tweepy.Client(
        consumer_key=credentials["X_CONSUMER_KEY"],
        consumer_secret=credentials["X_CONSUMER_SECRET"],
        access_token=credentials["X_ACCESS_TOKEN"],
        access_token_secret=credentials["X_ACCESS_TOKEN_SECRET"],
    )
    return client


def get_current_timestamp() -> str:
    """
    Generate a formatted timestamp string for the current UTC time.

    Returns:
        str: Current date and time in 'YYYY-MM-DD HH:MM:SS UTC' format.
    """
    # Use timezone-aware datetime to avoid deprecation warnings
    # and ensure consistent UTC timestamps
    now = datetime.now(timezone.utc)
    return now.strftime("%Y-%m-%d %H:%M:%S UTC")


def post_status_update(client: tweepy.Client, message: str) -> None:
    """
    Post a status update (tweet) to X/Twitter.

    Args:
        client: Authenticated tweepy Client instance.
        message: The text content to post.

    Raises:
        tweepy.TweepyException: If the API request fails.
    """
    try:
        # Create a tweet using the v2 API
        response = client.create_tweet(text=message)

        # Extract the tweet ID from the response for confirmation
        tweet_id = response.data["id"]
        print(f"Successfully posted tweet (ID: {tweet_id})")
        print(f"Message: {message}")

    except tweepy.TweepyException as e:
        print(f"Error posting tweet: {e}")
        raise


def main() -> None:
    """
    Main entry point for the status notification script.

    This function orchestrates the entire process:
    1. Load API credentials from environment variables
    2. Create an authenticated X/Twitter client
    3. Generate the status message with current timestamp
    4. Post the status update
    """
    print("=" * 50)
    print("AvicBot Status Notification")
    print("=" * 50)

    # Step 1: Get API credentials from environment
    print("\nLoading API credentials...")
    credentials = get_api_credentials()
    print("Credentials loaded successfully.")

    # Step 2: Create authenticated client
    print("Authenticating with X/Twitter API...")
    client = create_twitter_client(credentials)
    print("Authentication successful.")

    # Step 3: Generate the status message
    timestamp = get_current_timestamp()
    status_message = f"All Systems Go! {timestamp}"

    # Step 4: Post the status update
    print(f"\nPosting status update...")
    post_status_update(client, status_message)

    print("\nDone!")


# =============================================================================
# Script entry point
# =============================================================================
if __name__ == "__main__":
    main()
