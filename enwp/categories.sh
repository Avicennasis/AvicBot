#!/bin/bash
# =============================================================================
# categories.sh - Wikipedia Category Listing Script
# =============================================================================
#
# This script generates list pages on English Wikipedia by extracting members
# from various categories related to blocked users, drafts, and AfC submissions.
# Each category is converted into a formatted list on a user subpage.
#
# The script uses Pywikibot's category.py script with the 'listify' action to:
#   1. Read all pages in a specified category
#   2. Generate a formatted wikitext list
#   3. Save the list to a target user page (with -overwrite)
#
# Categories processed:
#   - Indefinitely blocked users (link-spamming, spamming, advertising)
#   - Misplaced userspace drafts
#   - G13-eligible AfC submissions
#   - Postponed G13 submissions
#
# Environment: Wikimedia Toolforge (formerly Tool Labs)
# Requirements: Pywikibot installed and configured
#
# Usage:
#   Run via cron or manually:
#   $ ./categories.sh
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
# Update this path if your Pywikibot installation is in a different location
readonly PYWIKIBOT_DIR="${PYWIKIBOT_DIR:-/shared/pywikipedia/core}"
readonly CATEGORY_SCRIPT="${PYWIKIBOT_DIR}/scripts/category.py"

# Common arguments for all category.py calls
readonly WIKI_ARGS="-family:wikipedia -lang:en"

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

run_listify() {
    # Run the category listify command for a given category and target page
    #
    # Arguments:
    #   $1 - Source category name (without "Category:" prefix)
    #   $2 - Target page title for the list output
    #
    # Returns:
    #   0 on success, non-zero on failure
    
    local from_category="$1"
    local to_page="$2"
    
    log_info "Processing: ${from_category} -> ${to_page}"
    
    if python "${CATEGORY_SCRIPT}" ${WIKI_ARGS} listify \
        -from:"${from_category}" \
        -to:"${to_page}" \
        -overwrite; then
        log_info "  ✓ Completed successfully"
        return 0
    else
        log_error "  ✗ Failed to process ${from_category}"
        return 1
    fi
}

# =============================================================================
# Main Script
# =============================================================================

main() {
    log_info "=========================================="
    log_info "Starting category listing operations"
    log_info "=========================================="
    
    # Track success/failure counts
    local success_count=0
    local failure_count=0
    
    # -------------------------------------------------------------------------
    # Blocked user categories
    # These track users indefinitely blocked for various spam-related offenses
    # -------------------------------------------------------------------------
    
    log_info ""
    log_info "--- Blocked User Categories ---"
    
    if run_listify "Wikipedians_who_are_indefinitely_blocked_for_link-spamming" \
                   "User:AvicBot/linkspam"; then
        ((success_count++))
    else
        ((failure_count++))
    fi
    
    if run_listify "Wikipedians_who_are_indefinitely_blocked_for_spamming" \
                   "User:AvicBot/spam"; then
        ((success_count++))
    else
        ((failure_count++))
    fi
    
    if run_listify "Wikipedians_who_are_indefinitely_blocked_for_advertising" \
                   "User:AvicBot/advertising"; then
        ((success_count++))
    else
        ((failure_count++))
    fi
    
    # -------------------------------------------------------------------------
    # Draft and AfC categories
    # These track articles for creation (AfC) submissions and userspace drafts
    # -------------------------------------------------------------------------
    
    log_info ""
    log_info "--- Draft & AfC Categories ---"
    
    if run_listify "Misplaced_userspace_drafts" \
                   "User:AvicBot/drafts2"; then
        ((success_count++))
    else
        ((failure_count++))
    fi
    
    if run_listify "G13_eligible_AfC_submissions" \
                   "User:AvicBot/G13"; then
        ((success_count++))
    else
        ((failure_count++))
    fi
    
    if run_listify "AfC_postponed_G13" \
                   "User:AvicBot/postponed"; then
        ((success_count++))
    else
        ((failure_count++))
    fi
    
    # -------------------------------------------------------------------------
    # Summary
    # -------------------------------------------------------------------------
    
    log_info ""
    log_info "=========================================="
    log_info "Completed: ${success_count} succeeded, ${failure_count} failed"
    log_info "=========================================="
    
    # Return non-zero exit code if any failures occurred
    if [[ ${failure_count} -gt 0 ]]; then
        return 1
    fi
    return 0
}

# =============================================================================
# Disabled Categories (Too Large)
# =============================================================================
# The following categories are too large to process with listify effectively.
# They have been disabled to prevent timeouts or excessive resource usage.
#
# To re-enable, uncomment the run_listify calls below:
#
# run_listify "Wikipedians_who_are_indefinitely_blocked_for_a_violation_of_the_username_policy" \
#             "User:AvicBot/upolvio"
#
# run_listify "User_talk_pages_with_conflict_of_interest_notices" \
#             "User:AvicBot/coi"
#
# run_listify "Stale_userspace_drafts" \
#             "User:AvicBot/drafts"
# =============================================================================

# Run the main function
main "$@"
