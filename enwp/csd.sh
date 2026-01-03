#!/bin/bash
# =============================================================================
# csd.sh - Candidates for Speedy Deletion Listing Script
# =============================================================================
#
# This script generates a list page on English Wikipedia containing all pages
# currently marked as candidates for speedy deletion (CSD). The list is saved
# to a user subpage for monitoring purposes.
#
# Speedy deletion is used for pages that clearly meet specific deletion
# criteria (e.g., vandalism, copyright violations, spam) and don't require
# a full deletion discussion.
#
# The script uses Pywikibot's category.py script with the 'listify' action.
#
# Environment: Wikimedia Toolforge (formerly Tool Labs)
# Requirements: Pywikibot installed and configured
#
# Usage:
#   Run via cron or manually:
#   $ ./csd.sh
#
# Note: This category can be very large during active periods. Monitor for
#       timeouts if running frequently.
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
readonly SOURCE_CATEGORY="Candidates_for_speedy_deletion"
readonly TARGET_PAGE="User:AvicBot/speedy"

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
    log_info "Speedy Deletion Candidates Listing"
    log_info "=========================================="
    log_info "Source: Category:${SOURCE_CATEGORY}"
    log_info "Target: ${TARGET_PAGE}"
    log_info ""
    
    # Run the Pywikibot category listify command
    # -from: specifies the source category
    # -to: specifies the target page for the generated list
    # -overwrite: replaces existing content on the target page
    
    if python "${CATEGORY_SCRIPT}" ${WIKI_ARGS} listify \
        -from:"${SOURCE_CATEGORY}" \
        -to:"${TARGET_PAGE}" \
        -overwrite; then
        log_info ""
        log_info "✓ Speedy deletion list updated successfully"
        return 0
    else
        log_error ""
        log_error "✗ Failed to update speedy deletion list"
        return 1
    fi
}

# Run the main function
main "$@"
