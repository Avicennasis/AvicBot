#!/bin/bash
# =============================================================================
# avicbotrdnewsall.sh - Wikinews Redirect Fixer Orchestrator
# =============================================================================
#
# Cron orchestrator script that runs the Wikinews redirect fixer for all
# global-bot-approved language editions. Designed to run as a scheduled job.
#
# This script iterates through all supported Wikinews languages and calls
# avicbotrdnews.sh for each one, logging progress to ~/logs/rdnews.log.
#
# Supported Languages (24 total):
#   ar, bg, bs, ca, cs, el, en, eo, fa, fi, he, ja, ko, no, pt, ro, ru,
#   sq, sr, sv, ta, tr, uk, zh
#
# Cron Example:
#   0 */6 * * * /path/to/avicbotrdnewsall.sh
#
# Environment: Wikimedia Toolforge
# Requirements: avicbotrdnews.sh in ~/.pywikibot/
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Originally written: 2014-2015 | Modernized: 2026
# =============================================================================

set -euo pipefail

# =============================================================================
# Configuration
# =============================================================================

# Path to the single-language redirect script
readonly REDIRECT_SCRIPT="${HOME}/.pywikibot/avicbotrdnews.sh"

# Log file location
readonly LOG_FILE="${HOME}/logs/rdnews.log"

# All global-bot-approved Wikinews languages
readonly LANGUAGES=(
    ar bg bs ca cs el en eo fa fi he ja ko no pt ro ru sq sr sv ta tr uk zh
)

# =============================================================================
# Helper Functions
# =============================================================================

log_message() {
    # Log a message with timestamp to both stdout and log file
    local message="$1"
    local timestamp
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
    echo "[${timestamp}] ${message}" | tee -a "${LOG_FILE}"
}

ensure_log_dir() {
    # Create log directory if it doesn't exist
    local log_dir
    log_dir="$(dirname "${LOG_FILE}")"
    if [[ ! -d "${log_dir}" ]]; then
        mkdir -p "${log_dir}"
    fi
}

# =============================================================================
# Main Script
# =============================================================================

main() {
    ensure_log_dir
    
    log_message "=========================================="
    log_message "Starting Wikinews Redirect Processing"
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
    
    local end_time
    end_time="$(date +%s)"
    local duration=$((end_time - start_time))
    local hours=$((duration / 3600))
    local minutes=$(((duration % 3600) / 60))
    
    log_message "=========================================="
    log_message "Completed Wikinews Redirect Processing"
    log_message "Success: ${success_count} | Failed: ${failure_count}"
    log_message "Duration: ${hours}h ${minutes}m"
    log_message "=========================================="
}

main "$@"
