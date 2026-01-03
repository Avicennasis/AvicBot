#!/bin/bash
# =============================================================================
# avicbotrdsource.sh - Wikisource Redirect Fixer
# =============================================================================
#
# Fixes broken and double redirects on Wikisource wikis. This script processes
# redirects across multiple namespaces for a single language edition.
#
# Wikisource is a free digital library of source texts that have been
# released to the public domain or are freely licensed.
#
# Global Bot-Approved Languages (9 total, as of August 2015):
#   ca, el, fa, it, ko, no, pl, vi, zh
#
# Usage:
#   Run with a language code as the first argument:
#   $ ./avicbotrdsource.sh it    # Process Italian Wikisource
#   $ ./avicbotrdsource.sh zh    # Process Chinese Wikisource
#
# Designed to be called by avicbotrdsourceall.sh via cron.
#
# Environment: Wikimedia Toolforge
# Requirements: Pywikibot installed and configured
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Originally written: 2014-2015 | Modernized: 2026
# =============================================================================

set -euo pipefail

# =============================================================================
# Configuration
# =============================================================================

readonly PYWIKIBOT_DIR="${PYWIKIBOT_DIR:-/shared/pywikipedia/core}"
readonly REDIRECT_SCRIPT="${PYWIKIBOT_DIR}/scripts/redirect.py"
readonly FAMILY="wikisource"

# =============================================================================
# Language Support Arrays
# =============================================================================

# Core namespaces: All wikis
readonly CORE_LANGS="ca el fa it ko no pl vi zh"

# Namespace 6 (File)
readonly NS6_LANGS="ca el it ko no pl vi zh"

# Namespace 7 (File talk)
readonly NS7_LANGS="ca el fa it ko pl zh"

# Namespace 13 (Help talk)
readonly NS13_LANGS="el it no pl zh"

# Namespace 100-101 (Author)
readonly NS100_101_LANGS="el fa ko pl"

# Namespace 104-105 (Page/Index)
readonly NS104_LANGS="ca fa it no pl vi zh"
readonly NS105_LANGS="ca it no pl vi zh"

# Namespace 106-107
readonly NS106_LANGS="ca fa it no vi zh"
readonly NS107_LANGS="ca it no vi zh"

# Namespace 108-109
readonly NS108_LANGS="el it zh"
readonly NS109_LANGS="el it"

# Italian-specific (110-112)
readonly NS_IT_LANGS="it"

# Chinese-specific (114-115)
readonly NS_ZH_LANGS="zh"

# Korean-specific (250, 252)
readonly NS_KO_LANGS="ko"

# Namespace 828 (Module)
readonly NS828_LANGS="ca el fa it ko pl vi zh"

# Namespace 829 (Module talk)
readonly NS829_LANGS="it"

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
    log_info "Wikisource Redirect Fixer - ${lang}"
    log_info "=========================================="
    
    # Core namespaces
    if contains_lang "${lang}" "${CORE_LANGS}"; then
        log_info "Processing core namespaces..."
        for ns in 103 102 15 14 12 11 10 9 8 5 4 3 2 1 0; do
            run_redirect "${lang}" "${ns}"
        done
    fi
    
    # File namespaces
    if contains_lang "${lang}" "${NS6_LANGS}"; then
        log_info "Processing File namespace (6)..."
        run_redirect "${lang}" 6
    fi
    
    if contains_lang "${lang}" "${NS7_LANGS}"; then
        log_info "Processing File talk namespace (7)..."
        run_redirect "${lang}" 7
    fi
    
    # Help talk
    if contains_lang "${lang}" "${NS13_LANGS}"; then
        log_info "Processing Help talk namespace (13)..."
        run_redirect "${lang}" 13
    fi
    
    # Author namespaces
    if contains_lang "${lang}" "${NS100_101_LANGS}"; then
        log_info "Processing Author namespaces (100-101)..."
        run_redirect "${lang}" 100
        run_redirect "${lang}" 101
    fi
    
    # Page/Index namespaces
    if contains_lang "${lang}" "${NS104_LANGS}"; then
        log_info "Processing Page namespace (104)..."
        run_redirect "${lang}" 104
    fi
    
    if contains_lang "${lang}" "${NS105_LANGS}"; then
        log_info "Processing Index namespace (105)..."
        run_redirect "${lang}" 105
    fi
    
    # Additional namespaces
    if contains_lang "${lang}" "${NS106_LANGS}"; then
        run_redirect "${lang}" 106
    fi
    
    if contains_lang "${lang}" "${NS107_LANGS}"; then
        run_redirect "${lang}" 107
    fi
    
    if contains_lang "${lang}" "${NS108_LANGS}"; then
        run_redirect "${lang}" 108
    fi
    
    if contains_lang "${lang}" "${NS109_LANGS}"; then
        run_redirect "${lang}" 109
    fi
    
    # Italian-specific namespaces
    if contains_lang "${lang}" "${NS_IT_LANGS}"; then
        log_info "Processing Italian-specific namespaces (110-112)..."
        for ns in 110 111 112; do
            run_redirect "${lang}" "${ns}"
        done
    fi
    
    # Chinese-specific namespaces
    if contains_lang "${lang}" "${NS_ZH_LANGS}"; then
        log_info "Processing Chinese-specific namespaces (114-115)..."
        run_redirect "${lang}" 114
        run_redirect "${lang}" 115
    fi
    
    # Korean-specific namespaces
    if contains_lang "${lang}" "${NS_KO_LANGS}"; then
        log_info "Processing Korean-specific namespaces (250, 252)..."
        run_redirect "${lang}" 250
        run_redirect "${lang}" 252
    fi
    
    # Module namespaces
    if contains_lang "${lang}" "${NS828_LANGS}"; then
        log_info "Processing Module namespace (828)..."
        run_redirect "${lang}" 828
    fi
    
    if contains_lang "${lang}" "${NS829_LANGS}"; then
        log_info "Processing Module talk namespace (829)..."
        run_redirect "${lang}" 829
    fi
    
    log_info "=========================================="
    log_info "✓ Completed Wikisource ${lang}"
    log_info "=========================================="
}

main "$@"
