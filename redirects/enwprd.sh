#!/bin/bash
# =============================================================================
# enwprd.sh - English Wikipedia Redirect Fixer
# =============================================================================
#
# Fixes broken and double redirects on English Wikipedia, the largest and
# most active Wikipedia with over 6 million articles.
#
# This script processes redirects across all namespaces including standard
# MediaWiki namespaces and Wikipedia-specific namespaces like Portal, Book,
# Draft, and TimedText.
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
readonly FAMILY="wikipedia"
readonly LANG="en"
readonly LOG_FILE="${HOME}/logs/enwprd.log"

# =============================================================================
# Namespace Definitions
# =============================================================================
# English Wikipedia uses many custom namespaces:
#   100-101: Portal
#   108-109: Book
#   118-119: Draft
#   447: Course (Education Program)
#   710-711: TimedText
#   828-829: Module
#   2600: Topic (Structured Discussions)
# =============================================================================

readonly NAMESPACES=(
    # Topic (Structured Discussions)
    2600
    # Module
    829 828
    # TimedText
    711 710
    # Course (Education Program)
    447
    # Draft
    119 118
    # Book
    109 108
    # Portal
    101 100
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
    log_info "English Wikipedia Redirect Fixer"
    log_info "=========================================="
    log_info "Namespaces to process: ${#NAMESPACES[@]}"
    
    local start_time
    start_time="$(date +%s)"
    
    # Phase 1: Fullscan all namespaces
    log_info ""
    log_info "Phase 1: Fullscan processing..."
    for ns in "${NAMESPACES[@]}"; do
        log_info "  Processing namespace ${ns}..."
        python "${REDIRECT_SCRIPT}" -fullscan do -family:${FAMILY} -always -lang:${LANG} -namespace:"${ns}" || true
    done
    
    # Phase 2: Special page fallback
    log_info ""
    log_info "Phase 2: Special page fallback..."
    for ns in "${NAMESPACES[@]}"; do
        log_info "  Processing namespace ${ns}..."
        python "${REDIRECT_SCRIPT}" do -family:${FAMILY} -always -lang:${LANG} -namespace:"${ns}" || true
    done
    
    local end_time duration hours minutes
    end_time="$(date +%s)"
    duration=$((end_time - start_time))
    hours=$((duration / 3600))
    minutes=$(((duration % 3600) / 60))
    
    log_info ""
    log_info "=========================================="
    log_info "✓ English Wikipedia redirect processing complete"
    log_info "Duration: ${hours}h ${minutes}m"
    log_info "=========================================="
}

main "$@"
