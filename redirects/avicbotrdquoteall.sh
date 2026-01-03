#!/bin/bash
# =============================================================================
# avicbotrdquoteall.sh - Wikiquote Redirect Fixer Orchestrator
# =============================================================================
#
# Cron orchestrator script that runs the Wikiquote redirect fixer for all
# global-bot-approved language editions. Designed to run as a scheduled job.
#
# Supported Languages (60 total):
#   af, ar, az, be, bg, br, bs, ca, cs, cy, da, el, eo, es, et, eu, fa, fi,
#   fr, gl, gu, he, hi, hu, hy, id, is, it, ja, ka, kn, ko, ku, ky, la, li,
#   lt, ml, mr, nl, nn, no, pt, ro, ru, sk, sl, sq, sr, su, sv, ta, te, tr,
#   uk, ur, uz, vi, wo, zh
#
# Cron Example:
#   0 0 * * 0 /path/to/avicbotrdquoteall.sh
#
# Environment: Wikimedia Toolforge
# Requirements: avicbotrdquote.sh in ~/.pywikibot/
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Originally written: 2014-2015 | Modernized: 2026
# =============================================================================

set -euo pipefail

# =============================================================================
# Configuration
# =============================================================================

readonly REDIRECT_SCRIPT="${HOME}/.pywikibot/avicbotrdquote.sh"
readonly LOG_FILE="${HOME}/logs/rdquote.log"

# All global-bot-approved Wikiquote languages (alphabetically sorted)
readonly LANGUAGES=(
    af ar az be bg br bs ca cs cy da el eo es et eu fa fi fr gl gu he hi hu
    hy id is it ja ka kn ko ku ky la li lt ml mr nl nn no pt ro ru sk sl sq
    sr su sv ta te tr uk ur uz vi wo zh
)

# =============================================================================
# Helper Functions
# =============================================================================

log_message() {
    local message="$1"
    local timestamp
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
    echo "[${timestamp}] ${message}" | tee -a "${LOG_FILE}"
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
    
    log_message "=========================================="
    log_message "Starting Wikiquote Redirect Processing"
    log_message "Languages: ${#LANGUAGES[@]}"
    log_message "=========================================="
    
    local success_count=0
    local failure_count=0
    local start_time
    start_time="$(date +%s)"
    
    for lang in "${LANGUAGES[@]}"; do
        log_message "Processing ${lang}..."
        
        if "${REDIRECT_SCRIPT}" "${lang}" >> "${LOG_FILE}" 2>&1; then
            log_message "  ✓ ${lang} done"
            ((success_count++))
        else
            log_message "  ✗ ${lang} failed"
            ((failure_count++))
        fi
    done
    
    local end_time duration hours minutes
    end_time="$(date +%s)"
    duration=$((end_time - start_time))
    hours=$((duration / 3600))
    minutes=$(((duration % 3600) / 60))
    
    log_message "=========================================="
    log_message "Completed Wikiquote Redirect Processing"
    log_message "Success: ${success_count} | Failed: ${failure_count}"
    log_message "Duration: ${hours}h ${minutes}m"
    log_message "=========================================="
}

main "$@"
