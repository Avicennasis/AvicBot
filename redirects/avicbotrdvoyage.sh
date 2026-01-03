#!/bin/bash
# =============================================================================
# avicbotrdvoyage.sh - Wikivoyage Redirect Fixer
# =============================================================================
#
# Fixes broken and double redirects on Wikivoyage wikis. This script processes
# redirects across multiple namespaces for a single language edition.
#
# Wikivoyage is a free travel guide that anyone can edit.
#
# Global Bot-Approved Languages (5 total, as of December 2016):
#   el, en, es, fa, ru
#
# Usage:
#   $ ./avicbotrdvoyage.sh en    # Process English Wikivoyage
#   $ ./avicbotrdvoyage.sh ru    # Process Russian Wikivoyage
#
# Environment: Wikimedia Toolforge
# Requirements: Pywikibot installed and configured
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Originally written: 2016 | Modernized: 2026
# =============================================================================

set -euo pipefail

# =============================================================================
# Configuration
# =============================================================================

readonly PYWIKIBOT_DIR="${PYWIKIBOT_DIR:-/shared/pywikipedia/core}"
readonly REDIRECT_SCRIPT="${PYWIKIBOT_DIR}/scripts/redirect.py"
readonly FAMILY="wikivoyage"

# =============================================================================
# Language Support
# =============================================================================

readonly CORE_LANGS="el en es fa ru"
readonly NS829_LANGS="en es"
readonly NS106_LANGS="fa"

# =============================================================================
# Helper Functions
# =============================================================================

log_info() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] INFO: $*"
}

log_error() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $*" >&2
}

contains_lang() {
    local lang="$1"
    local list="$2"
    [[ " ${list} " =~ " ${lang} " ]]
}

run_redirect() {
    local lang="$1"
    local namespace="$2"
    
    local base_args="${REDIRECT_SCRIPT} -family:${FAMILY} -always -lang:${lang} -namespace:${namespace}"
    
    python ${base_args} -fullscan do || true
    python ${base_args} do || true
}

# =============================================================================
# Main Script
# =============================================================================

main() {
    local lang="${1:-}"
    
    if [[ -z "${lang}" ]]; then
        log_error "Usage: $0 <language_code>"
        exit 1
    fi
    
    log_info "=========================================="
    log_info "Wikivoyage Redirect Fixer - ${lang}"
    log_info "=========================================="
    
    # Core namespaces (all Wikivoyages)
    if contains_lang "${lang}" "${CORE_LANGS}"; then
        log_info "Processing all namespaces..."
        
        # Special Wikivoyage namespaces first
        for ns in 2600 2303 2302 2301 2300 829 828; do
            run_redirect "${lang}" "${ns}"
        done
        
        # Standard MediaWiki namespaces
        for ns in 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0; do
            run_redirect "${lang}" "${ns}"
        done
    fi
    
    # Module talk namespace (en, es only)
    if contains_lang "${lang}" "${NS829_LANGS}"; then
        log_info "Processing Module talk namespace (829)..."
        run_redirect "${lang}" 829
    fi
    
    # Persian-specific namespace
    if contains_lang "${lang}" "${NS106_LANGS}"; then
        log_info "Processing Persian-specific namespace (106)..."
        run_redirect "${lang}" 106
    fi
    
    log_info "=========================================="
    log_info "✓ Completed Wikivoyage ${lang}"
    log_info "=========================================="
}

main "$@"
