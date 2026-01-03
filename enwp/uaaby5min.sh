#!/bin/bash
# =============================================================================
# uaaby5min.sh - Username Policy Issues Report (5-Minute Interval)
# =============================================================================
#
# This script generates a frequently-updated list of Wikipedia usernames that
# may have policy issues. It's designed to run every 5 minutes via cron to
# provide near-real-time monitoring for the Username Administrators (UAA).
#
# The Username Policy (WP:USERNAME) prohibits usernames that are:
#   - Promotional or suggesting organizational affiliation
#   - Misleading or impersonating others
#   - Offensive or disruptive
#   - Too similar to existing usernames
#
# This script outputs to a separate report page from the standard UAA report
# to provide a more frequent snapshot for active monitoring.
#
# Category: Wikipedia usernames with possible policy issues
# Target: User:Avicennasis/reports/uaa/report/by5min
#
# Environment: Wikimedia Toolforge (formerly Tool Labs)
# Requirements: Pywikibot installed and configured
#
# Cron Example (every 5 minutes):
#   */5 * * * * /path/to/uaaby5min.sh >> /path/to/logs/uaa5min.log 2>&1
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Originally written: 2014 | Modernized: 2026
# =============================================================================

set -euo pipefail  # Exit on error, undefined vars, and pipe failures

# =============================================================================
# Configuration
# =============================================================================

# Path to Pywikibot installation on Toolforge
readonly PYWIKIBOT_DIR="${PYWIKIBOT_DIR:-/shared/pywikipedia/core}"
readonly CATEGORY_SCRIPT="${PYWIKIBOT_DIR}/scripts/category.py"

# Wiki and category settings
readonly WIKI_ARGS="-family:wikipedia -lang:en"
readonly SOURCE_CATEGORY="Wikipedia_usernames_with_possible_policy_issues"
readonly TARGET_PAGE="User:Avicennasis/reports/uaa/report/by5min"

# =============================================================================
# Helper Functions
# =============================================================================

log_info() {
    # Log an informational message with timestamp
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] INFO: $*"
}

log_error() {
    # Log an error message with timestamp to stderr
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $*" >&2
}

# =============================================================================
# Main Script
# =============================================================================

main() {
    log_info "=========================================="
    log_info "UAA Report (5-Minute Update)"
    log_info "=========================================="
    log_info "Source: Category:${SOURCE_CATEGORY}"
    log_info "Target: ${TARGET_PAGE}"
    log_info ""
    
    # Run the Pywikibot category listify command
    # This generates a wikitext list of all pages in the category
    # and saves it to the target user page
    
    if python "${CATEGORY_SCRIPT}" ${WIKI_ARGS} listify \
        -from:"${SOURCE_CATEGORY}" \
        -to:"${TARGET_PAGE}" \
        -overwrite; then
        log_info ""
        log_info "✓ UAA 5-minute report updated successfully"
        return 0
    else
        log_error ""
        log_error "✗ Failed to update UAA 5-minute report"
        return 1
    fi
}

# Run the main function
main "$@"
