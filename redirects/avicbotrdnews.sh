#!/bin/bash
# =============================================================================
# avicbotrdnews.sh - Wikinews Redirect Fixer
# =============================================================================
#
# Fixes broken and double redirects on Wikinews wikis. This script processes
# redirects across multiple namespaces for a single language edition.
#
# Wikinews is a free-content news wiki where contributors write and publish
# original news articles. This bot helps maintain redirect health.
#
# Global Bot-Approved Languages (as of August 2015):
#   ar, bg, bs, ca, cs, el, en, eo, fa, fi, he, ja, ko, no, pt, ro, ru,
#   sq, sr, sv, ta, tr, uk, zh
#
# Usage:
#   Run with a language code as the first argument:
#   $ ./avicbotrdnews.sh en    # Process English Wikinews
#   $ ./avicbotrdnews.sh ja    # Process Japanese Wikinews
#
# Designed to be called by avicbotrdnewsall.sh via cron.
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
readonly FAMILY="wikinews"

# =============================================================================
# Language Support Arrays
# =============================================================================
# Different namespaces are available on different language wikis.
# These arrays define which languages support which namespace groups.
# =============================================================================

# Core namespaces (0-14 except 6-7, plus 8-12): Most wikis
readonly CORE_LANGS="ar bg bs ca cs el en eo fa fi he ja ko no pt ro ru sq sr sv ta tr uk zh"

# Namespace 6 (File): Most wikis except a few
readonly NS6_LANGS="ar bg bs cs el en fa fi he ja ko no pt ro ru sr sv tr uk zh"

# Namespace 7 (File talk): Fewer wikis
readonly NS7_LANGS="bg en fi he ja pt ru sv zh"

# Namespace 13 (Help talk): Limited wikis
readonly NS13_LANGS="cs en fi he pt ru zh"

# Namespace 15 (Category talk): Many wikis
readonly NS15_LANGS="ar ca cs el en eo fa fi he ja ko no pt ro ru sr sv ta tr uk zh"

# Namespace 90-92 (English only - custom)
readonly NS90_92_LANGS="en"

# Namespace 100-101 (Portal namespaces)
readonly NS100_LANGS="ar ca en fa he ja no pt ru sq ta tr zh"
readonly NS101_LANGS="ar en fa he ja no pt ru ta tr zh"

# Namespace 102 (WikiProject)
readonly NS102_LANGS="ar bg ca el en fa pt ru sq sr uk"

# Namespace 103 (WikiProject talk - pt only)
readonly NS103_LANGS="pt"

# Namespace 104 (uk only)
readonly NS104_LANGS="uk"

# Namespace 106-107 (no only)
readonly NS106_107_LANGS="no"

# Namespace 108-109 (ja only)
readonly NS108_109_LANGS="ja"

# Namespace 828 (Module)
readonly NS828_LANGS="ca cs en fa ro ru uk zh"

# Namespace 829 (Module talk)
readonly NS829_LANGS="cs uk"

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
    # Check if a language code is in a space-separated list
    local lang="$1"
    local list="$2"
    [[ " ${list} " =~ " ${lang} " ]]
}

run_redirect() {
    # Run redirect.py for a specific namespace
    # Uses fullscan first, then falls back to special page
    local lang="$1"
    local namespace="$2"
    local use_fullscan="${3:-true}"
    
    local base_args="${REDIRECT_SCRIPT} -family:${FAMILY} -always -lang:${lang} -namespace:${namespace}"
    
    if [[ "${use_fullscan}" == "true" ]]; then
        python ${base_args} -fullscan do || true
    fi
    python ${base_args} do || true
}

process_namespace_group() {
    # Process a group of namespaces for the given language
    local lang="$1"
    shift
    local namespaces=("$@")
    
    for ns in "${namespaces[@]}"; do
        log_info "  Processing namespace ${ns}..."
        run_redirect "${lang}" "${ns}"
    done
}

# =============================================================================
# Main Script
# =============================================================================

main() {
    local lang="${1:-}"
    
    if [[ -z "${lang}" ]]; then
        log_error "Usage: $0 <language_code>"
        log_error "Example: $0 en"
        exit 1
    fi
    
    log_info "=========================================="
    log_info "Wikinews Redirect Fixer - ${lang}"
    log_info "=========================================="
    
    # Core namespaces (most wikis)
    if contains_lang "${lang}" "${CORE_LANGS}"; then
        log_info "Processing core namespaces..."
        process_namespace_group "${lang}" 14 12 11 10 9 8 5 4 3 2 1 0
    fi
    
    # Namespace 6 (File)
    if contains_lang "${lang}" "${NS6_LANGS}"; then
        log_info "Processing File namespace (6)..."
        run_redirect "${lang}" 6
    fi
    
    # Namespace 7 (File talk)
    if contains_lang "${lang}" "${NS7_LANGS}"; then
        log_info "Processing File talk namespace (7)..."
        run_redirect "${lang}" 7
    fi
    
    # Namespace 13 (Help talk)
    if contains_lang "${lang}" "${NS13_LANGS}"; then
        log_info "Processing Help talk namespace (13)..."
        run_redirect "${lang}" 13
    fi
    
    # Namespace 15 (Category talk)
    if contains_lang "${lang}" "${NS15_LANGS}"; then
        log_info "Processing Category talk namespace (15)..."
        run_redirect "${lang}" 15
    fi
    
    # English-only namespaces
    if contains_lang "${lang}" "${NS90_92_LANGS}"; then
        log_info "Processing English-specific namespaces (90, 92)..."
        run_redirect "${lang}" 90
        run_redirect "${lang}" 92
    fi
    
    # Portal namespaces
    if contains_lang "${lang}" "${NS100_LANGS}"; then
        log_info "Processing Portal namespace (100)..."
        run_redirect "${lang}" 100
    fi
    
    if contains_lang "${lang}" "${NS101_LANGS}"; then
        log_info "Processing Portal talk namespace (101)..."
        run_redirect "${lang}" 101
    fi
    
    # WikiProject namespace
    if contains_lang "${lang}" "${NS102_LANGS}"; then
        log_info "Processing WikiProject namespace (102)..."
        run_redirect "${lang}" 102
    fi
    
    # Language-specific namespaces
    if contains_lang "${lang}" "${NS103_LANGS}"; then
        log_info "Processing namespace 103..."
        run_redirect "${lang}" 103
    fi
    
    if contains_lang "${lang}" "${NS104_LANGS}"; then
        log_info "Processing namespace 104..."
        run_redirect "${lang}" 104
    fi
    
    if contains_lang "${lang}" "${NS106_107_LANGS}"; then
        log_info "Processing namespaces 106-107..."
        run_redirect "${lang}" 106
        run_redirect "${lang}" 107
    fi
    
    if contains_lang "${lang}" "${NS108_109_LANGS}"; then
        log_info "Processing namespaces 108-109..."
        run_redirect "${lang}" 108
        run_redirect "${lang}" 109
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
    log_info "✓ Completed Wikinews ${lang}"
    log_info "=========================================="
}

main "$@"
