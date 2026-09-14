#!/bin/bash
# =============================================================================
# listify-category.sh - Shared category-listify runner
# =============================================================================
#
# Generates a wikitext list page from a source category using Pywikibot's
# category.py 'listify' action. The single-category wrappers (csd.sh,
# uaareport.sh, uaaby5min.sh) call this with their own config, so the
# boilerplate lives in one place (FR-284).
#
# Environment: Wikimedia Toolforge (formerly Tool Labs)
# Requirements: Pywikibot installed and configured
#
# Usage:
#   listify-category.sh <source-category> <target-page> [label]
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Modernized: 2026
# =============================================================================

set -euo pipefail

SOURCE_CATEGORY="${1:?Usage: listify-category.sh <source-category> <target-page> [label]}"
TARGET_PAGE="${2:?Usage: listify-category.sh <source-category> <target-page> [label]}"
LABEL="${3:-${SOURCE_CATEGORY}}"

# Path to Pywikibot installation (modern Toolforge keeps it under $HOME;
# override with PYWIKIBOT_DIR).
readonly PYWIKIBOT_DIR="${PYWIKIBOT_DIR:-${HOME}/pywikibot}"
readonly CATEGORY_SCRIPT="${PYWIKIBOT_DIR}/scripts/category.py"
readonly WIKI_ARGS=(-family:wikipedia -lang:en)

log_info() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] INFO: $*"; }
log_error() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $*" >&2; }

log_info "=========================================="
log_info "${LABEL}"
log_info "=========================================="
log_info "Source: Category:${SOURCE_CATEGORY}"
log_info "Target: ${TARGET_PAGE}"
log_info ""

if python "${CATEGORY_SCRIPT}" "${WIKI_ARGS[@]}" listify \
    -from:"${SOURCE_CATEGORY}" \
    -to:"${TARGET_PAGE}" \
    -overwrite; then
    log_info ""
    log_info "[done] ${LABEL} updated successfully"
    exit 0
else
    log_error ""
    log_error "[x] Failed to update ${LABEL}"
    exit 1
fi
