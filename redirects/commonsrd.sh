#!/bin/bash
# =============================================================================
# commonsrd.sh - Wikimedia Commons Redirect Fixer
# =============================================================================
#
# Fixes broken and double redirects on Wikimedia Commons, the free media
# repository used by all Wikimedia projects. Commons hosts over 90 million
# freely usable media files.
#
# This script processes redirects across all namespaces on Commons, including
# standard MediaWiki namespaces and Commons-specific namespaces like Creator,
# Institution, and Campaign.
#
# Designed to run via cron on Wikimedia Toolforge.
#
# Environment: Wikimedia Toolforge
# Requirements: Pywikibot installed and configured
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Originally written: 2014 | Modernized: 2026
# =============================================================================

set -euo pipefail

# =============================================================================
# Configuration
# =============================================================================

readonly PYWIKIBOT_DIR="${PYWIKIBOT_DIR:-/shared/pywikipedia/core}"
readonly REDIRECT_SCRIPT="${PYWIKIBOT_DIR}/scripts/redirect.py"
readonly FAMILY="commons"
readonly LANG="commons"
readonly LOG_FILE="${HOME}/logs/commonsrd.log"

# =============================================================================
# Namespace Definitions
# =============================================================================
# Commons has many custom namespaces beyond the standard MediaWiki set.
# These are organized by purpose:
#
# Standard MediaWiki namespaces (0-15)
# Custom namespaces:
#   100-107: Creator, Institution, etc.
#   460-461: Campaign
#   486-491: Data
#   828-829: Module
#   1198-1199: Translations
#   2300-2303: Gadget
#   2600: Topic
# =============================================================================

readonly NAMESPACES=(
    # Topic (Structured Discussions)
    2600
    # Gadget namespaces
    2303 2302 2301 2300
    # Translations
    1199 1198
    # Module
    829 828
    # Data namespaces
    491 490 487 486
    # Campaign
    461 460
    # Custom content namespaces
    107 106 105 104 103 102 101 100
    # Standard namespaces
    15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0
)

# =============================================================================
# Helper Functions
# =============================================================================

log_info() {
    local message="$*"
    local timestamp
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
    echo "[${timestamp}] INFO: ${message}" | tee -a "${LOG_FILE}"
}

log_error() {
    local message="$*"
    local timestamp
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
    echo "[${timestamp}] ERROR: ${message}" | tee -a "${LOG_FILE}" >&2
}

ensure_log_dir() {
    local log_dir
    log_dir="$(dirname "${LOG_FILE}")"
    [[ -d "${log_dir}" ]] || mkdir -p "${log_dir}"
}

run_redirect() {
    # Run redirect.py for a namespace with fullscan, then special page fallback
    local namespace="$1"
    
    local base_args="${REDIRECT_SCRIPT} do -family:${FAMILY} -lang:${LANG} -always -namespace:${namespace}"
    
    # Fullscan: iterates through all pages to find broken redirects
    python ${base_args} -fullscan || true
    
    # Special page fallback: uses Special:BrokenRedirects
    python ${base_args} || true
}

# =============================================================================
# Main Script
# =============================================================================

main() {
    ensure_log_dir
    
    log_info "=========================================="
    log_info "Wikimedia Commons Redirect Fixer"
    log_info "=========================================="
    log_info "Namespaces to process: ${#NAMESPACES[@]}"
    
    local start_time
    start_time="$(date +%s)"
    
    # Phase 1: Fullscan all namespaces
    log_info ""
    log_info "Phase 1: Fullscan processing..."
    for ns in "${NAMESPACES[@]}"; do
        log_info "  Processing namespace ${ns}..."
        python "${REDIRECT_SCRIPT}" do -family:${FAMILY} -lang:${LANG} -fullscan -always -namespace:"${ns}" || true
    done
    
    # Phase 2: Special page fallback for all namespaces
    log_info ""
    log_info "Phase 2: Special page fallback..."
    for ns in "${NAMESPACES[@]}"; do
        log_info "  Processing namespace ${ns}..."
        python "${REDIRECT_SCRIPT}" do -family:${FAMILY} -lang:${LANG} -always -namespace:"${ns}" || true
    done
    
    local end_time duration hours minutes
    end_time="$(date +%s)"
    duration=$((end_time - start_time))
    hours=$((duration / 3600))
    minutes=$(((duration % 3600) / 60))
    
    log_info ""
    log_info "=========================================="
    log_info "✓ Commons redirect processing complete"
    log_info "Duration: ${hours}h ${minutes}m"
    log_info "=========================================="
}

main "$@"
