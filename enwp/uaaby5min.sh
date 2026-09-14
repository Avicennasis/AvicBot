#!/bin/bash
# =============================================================================
# uaaby5min.sh - Username Policy Issues Report (5-Minute Interval)
# =============================================================================
#
# Frequently-updated UAA username list for near-real-time monitoring.
#
# Delegates the shared category-listify logic to listify-category.sh (FR-284).
#
# Environment: Wikimedia Toolforge (formerly Tool Labs)
# Requirements: Pywikibot installed and configured
# Usage: ./uaaby5min.sh
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Originally written: 2014 | Modernized: 2026
# =============================================================================

set -euo pipefail

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
exec "${SCRIPT_DIR}/listify-category.sh" \
    "Wikipedia_usernames_with_possible_policy_issues" \
    "User:Avicennasis/reports/uaa/report/by5min" \
    "UAA Report (5-Minute Update)"
