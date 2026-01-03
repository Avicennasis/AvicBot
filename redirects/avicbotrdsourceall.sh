#!/bin/bash
# =============================================================================
# avicbotrdsourceall.sh - Wikisource Redirect Fixer Orchestrator
# =============================================================================
#
# Cron orchestrator script that runs the Wikisource redirect fixer for all
# global-bot-approved language editions.
#
# Supported Languages (9 total):
#   ca, el, fa, it, ko, no, pl, vi, zh
#
# Cron Example:
#   0 0 * * 1 /path/to/avicbotrdsourceall.sh
#
# Environment: Wikimedia Toolforge
# Requirements: avicbotrdsource.sh in ~/.pywikibot/
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Originally written: 2014-2015 | Modernized: 2026
# =============================================================================

set -euo pipefail

# =============================================================================
# Configuration
# =============================================================================

readonly REDIRECT_SCRIPT="${HOME}/.pywikibot/avicbotrdsource.sh"
readonly LOG_FILE="${HOME}/logs/rdsource.log"

readonly LANGUAGES=(ca el fa it ko no pl vi zh)

# =============================================================================
# Helper Functions
# =============================================================================

log_message() {
    local timestamp
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
    echo "[${timestamp}] $1" | tee -a "${LOG_FILE}"
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
    log_message "Starting Wikisource Redirect Processing"
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
    log_message "Completed Wikisource Redirect Processing"
    log_message "Success: ${success_count} | Failed: ${failure_count}"
    log_message "Duration: ${hours}h ${minutes}m"
    log_message "=========================================="
}

main "$@"
