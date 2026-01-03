#!/bin/bash
# =============================================================================
# avicbotrdquote.sh - Wikiquote Redirect Fixer
# =============================================================================
#
# Fixes broken and double redirects on Wikiquote wikis. This script processes
# redirects across multiple namespaces for a single language edition.
#
# Wikiquote is a free compendium of quotations from notable people and works.
# This bot helps maintain redirect health across the project.
#
# Global Bot-Approved Languages (60 total, as of August 2015):
#   af, ar, az, be, bg, br, bs, ca, cs, cy, da, el, eo, es, et, eu, fa, fi,
#   fr, gl, gu, he, hi, hu, hy, id, is, it, ja, ka, kn, ko, ku, ky, la, li,
#   lt, ml, mr, nl, nn, no, pt, ro, ru, sk, sl, sq, sr, su, sv, ta, te, tr,
#   uk, ur, uz, vi, wo, zh
#
# Usage:
#   Run with a language code as the first argument:
#   $ ./avicbotrdquote.sh en    # Process English Wikiquote
#   $ ./avicbotrdquote.sh fr    # Process French Wikiquote
#
# Designed to be called by avicbotrdquoteall.sh via cron.
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
readonly FAMILY="wikiquote"

# =============================================================================
# Language Support Arrays
# =============================================================================

# Core namespaces: All wikis
readonly CORE_LANGS="af ar az be bg br bs ca cs cy da el eo es et eu fa fi fr gl gu he hi hu hy id is it ja ka kn ko ku ky la li lt ml mr nl nn no pt ro ru sk sl sq sr su sv ta te tr uk ur uz vi wo zh"

# Namespace 6 (File)
readonly NS6_LANGS="ar az bg bs ca cs da el eo et fa fi he hu hy id is it ja ka ko ku la lt ml mr nl nn no pt ro ru sk sl sq sr su sv ta te tr ur uz vi zh"

# Namespace 7 (File talk)
readonly NS7_LANGS="ar bs ca da el he hu it ka ru sk tr vi"

# Namespace 9 (MediaWiki talk)
readonly NS9_LANGS="af ar az bg br bs ca cs cy da el eo es et eu fa fi fr gl gu he hi hu hy id is it ja ka kn ko ku ky la lt ml mr nl nn no pt ro ru sk sl sq sr sv tr uk ur vi zh"

# Namespace 11 (Template talk)
readonly NS11_LANGS="af ar az bg br bs ca cs da el es et fa fi fr gl he hi hu hy id is it ja ka ko no pt ro ru sk sl sq sr sv ta tr uk uz vi zh"

# Namespace 12 (Help)
readonly NS12_LANGS="ar az bg br bs ca cs cy da el es fa fi fr gl gu he hu hy id is it ja ka kn ko ku ky la lt ml mr nl nn no pt ro ru sk sl sq sr su sv ta te tr uk vi zh"

# Namespace 13 (Help talk)
readonly NS13_LANGS="ar bg ca es fi fr he id it ka ro ru sk tr uk ur vi"

# Namespace 15 (Category talk)
readonly NS15_LANGS="ar be bg bs ca cs da el es et eu fa fi fr gl he hu hy id is it ja ka ko ku lt ml nl pt ru sk sr sv te tr uk vi"

# Namespace 100-101 (Topic namespaces)
readonly NS100_LANGS="cs sk zh"
readonly NS101_LANGS="cs he sk zh"

# French-specific namespaces
readonly NS_FR_LANGS="fr"

# Namespace 828 (Module)
readonly NS828_LANGS="bs ca cs el eo es fa fr hy id it nl no pt ru ta te tr ur vi zh"

# Namespace 829 (Module talk)
readonly NS829_LANGS="ca it"

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
    
    # Try fullscan first, then special page fallback
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
    log_info "Wikiquote Redirect Fixer - ${lang}"
    log_info "=========================================="
    
    # Core namespaces
    if contains_lang "${lang}" "${CORE_LANGS}"; then
        log_info "Processing core namespaces..."
        for ns in 14 10 8 5 4 3 2 1 0; do
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
    
    # Talk namespaces
    if contains_lang "${lang}" "${NS9_LANGS}"; then
        log_info "Processing MediaWiki talk namespace (9)..."
        run_redirect "${lang}" 9
    fi
    
    if contains_lang "${lang}" "${NS11_LANGS}"; then
        log_info "Processing Template talk namespace (11)..."
        run_redirect "${lang}" 11
    fi
    
    if contains_lang "${lang}" "${NS12_LANGS}"; then
        log_info "Processing Help namespace (12)..."
        run_redirect "${lang}" 12
    fi
    
    if contains_lang "${lang}" "${NS13_LANGS}"; then
        log_info "Processing Help talk namespace (13)..."
        run_redirect "${lang}" 13
    fi
    
    if contains_lang "${lang}" "${NS15_LANGS}"; then
        log_info "Processing Category talk namespace (15)..."
        run_redirect "${lang}" 15
    fi
    
    # Topic namespaces
    if contains_lang "${lang}" "${NS100_LANGS}"; then
        log_info "Processing Topic namespace (100)..."
        run_redirect "${lang}" 100
    fi
    
    if contains_lang "${lang}" "${NS101_LANGS}"; then
        log_info "Processing Topic talk namespace (101)..."
        run_redirect "${lang}" 101
    fi
    
    # French-specific namespaces
    if contains_lang "${lang}" "${NS_FR_LANGS}"; then
        log_info "Processing French-specific namespaces (102-108)..."
        for ns in 108 105 104 103 102; do
            run_redirect "${lang}" "${ns}"
        done
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
    log_info "✓ Completed Wikiquote ${lang}"
    log_info "=========================================="
}

main "$@"
