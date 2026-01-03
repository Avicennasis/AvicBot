#!/bin/bash
# =============================================================================
# crash.sh - Crash Notification Script
# =============================================================================
#
# Posts a notification to the bot's crash log on-wiki when the server restarts
# or recovers from a crash.
#
# Usage:
#   ./crash.sh
#
# Environment: Wikimedia Toolforge
# Requirements: Pywikibot installed and configured
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Modernized: 2026
# =============================================================================

set -euo pipefail

# =============================================================================
# Configuration
# =============================================================================

readonly PYWIKIBOT_DIR="${PYWIKIBOT_DIR:-/shared/pywikipedia/core}"
readonly ADD_TEXT_SCRIPT="${PYWIKIBOT_DIR}/scripts/add_text.py"

readonly FAMILY="wikipedia"
readonly LANG="en"
readonly PAGE="User:AvicBot/crashlog"
readonly MESSAGE="==Notice==\nAvicBot Wikimedia Tool Labs server has crashed and restarted. ~~~~"
readonly SUMMARY="Notice"

# =============================================================================
# Main Script
# =============================================================================

main() {
    echo "[$(date)] Running crash notification..."

    if [[ ! -f "${ADD_TEXT_SCRIPT}" ]]; then
        echo "Error: add_text.py not found at ${ADD_TEXT_SCRIPT}" >&2
        exit 1
    fi

    python "${ADD_TEXT_SCRIPT}" \
        -family:"${FAMILY}" \
        -lang:"${LANG}" \
        -page:"${PAGE}" \
        -text:"${MESSAGE}" \
        -summary:"${SUMMARY}" \
        -always

    echo "[$(date)] Notification sent."
}

main "$@"
