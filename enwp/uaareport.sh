#!/bin/bash
# =============================================================================
# uaareport.sh - Username Policy Issues Report (30-Minute Interval)
# =============================================================================
#
# Generates a list of usernames that may have policy issues, for the Username Administrators (UAA).
#
# Delegates the shared category-listify logic to listify-category.sh (FR-284).
#
# Environment: Wikimedia Toolforge (formerly Tool Labs)
# Requirements: Pywikibot installed and configured
# Usage: ./uaareport.sh
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Originally written: 2014 | Modernized: 2026
# =============================================================================

set -euo pipefail

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
exec "${SCRIPT_DIR}/listify-category.sh" \
    "Wikipedia_usernames_with_possible_policy_issues" \
    "User:Avicennasis/reports/uaa/report" \
    "UAA Report (30-Minute Update)"
