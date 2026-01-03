#!/bin/bash
# =============================================================================
# metard.sh - Wikimedia Meta-Wiki Redirect Fixer
# =============================================================================
#
# Fixes broken and double redirects on Meta-Wiki, the global coordination wiki
# for the Wikimedia movement. Meta hosts policies, discussions, and coordination
# pages for all Wikimedia projects.
#
# This script processes redirects across all namespaces including Meta-specific
# namespaces for grants, research, and coordination.
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
readonly FAMILY="meta"
readonly LANG="meta"
readonly LOG_FILE="${HOME}/logs/metard.log"

# =============================================================================
# Namespace Definitions
# =============================================================================
# Meta-Wiki has many coordination namespaces:
#   200-209: Coordination/grants namespaces
#   470-471, 485-487: Research/data namespaces
#   828-829: Module
#   866-867: CNBanner (Central Notice)
#   1198-1199: Translations
#   2600: Topic (Structured Discussions)
# =============================================================================

readonly NAMESPACES=(
    # Topic (Structured Discussions)
    2600
    # Translations
    1199 1198
    # Central Notice Banner
    867 866
    # Module
    829 828
    # Research/Data namespaces
    487 486 485
    # Coordination namespaces
    471 470
    # Grants and coordination (200 series)
    209 208 207 206 205 204 203 202 201 200
    # Standard namespaces
    15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0
)

# =============================================================================
# Helper Functions
# =============================================================================

log_info() {
    local timestamp
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
    echo "[${timestamp}] INFO: $*" | tee -a "${LOG_FILE}"
}

ensure_log_dir() {
    local log_dir
    log_dir="$(dirname "${LOG_FILE}")"
    [[ -d "${log_dir}" ]] || mkdir -p "${log_dir}"
}

# =============================================================================
# Main Script
# =============================================================================

main() {
    ensure_log_dir
    
    log_info "=========================================="
    log_info "Meta-Wiki Redirect Fixer"
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
    
    # Phase 2: Special page fallback
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
    log_info "✓ Meta-Wiki redirect processing complete"
    log_info "Duration: ${hours}h ${minutes}m"
    log_info "=========================================="
}

main "$@"
