#!/bin/bash
# =============================================================================
# csd.sh - Candidates for Speedy Deletion Listing Script
# =============================================================================
#
# Generates a list page of pages marked as candidates for speedy deletion.
#
# Delegates the shared category-listify logic to listify-category.sh (FR-284).
#
# Environment: Wikimedia Toolforge (formerly Tool Labs)
# Requirements: Pywikibot installed and configured
# Usage: ./csd.sh
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Originally written: 2014 | Modernized: 2026
# =============================================================================

set -euo pipefail

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
exec "${SCRIPT_DIR}/listify-category.sh" \
    "Candidates_for_speedy_deletion" \
    "User:AvicBot/speedy" \
    "Speedy Deletion Candidates"
