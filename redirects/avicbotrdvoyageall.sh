#!/bin/bash
# =============================================================================
# avicbotrdvoyageall.sh - Wikivoyage Redirect Fixer Orchestrator
# =============================================================================
#
# Cron orchestrator for Wikivoyage redirect fixing across all supported wikis.
#
# Supported Languages (5 total):
#   el, en, es, fa, ru
#
# Cron Example:
#   0 0 * * 2 /path/to/avicbotrdvoyageall.sh
#
# Environment: Wikimedia Toolforge
# Requirements: avicbotrdvoyage.sh in ~/.pywikibot/
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Originally written: 2016 | Modernized: 2026
# =============================================================================

set -euo pipefail

# =============================================================================
# Configuration
# =============================================================================

readonly REDIRECT_SCRIPT="${HOME}/.pywikibot/avicbotrdvoyage.sh"
readonly LOG_FILE="${HOME}/logs/rdvoyage.log"

readonly LANGUAGES=(el en es fa ru)

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
    log_message "Starting Wikivoyage Redirect Processing"
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
    log_message "Completed Wikivoyage Redirect Processing"
    log_message "Success: ${success_count} | Failed: ${failure_count}"
    log_message "Duration: ${hours}h ${minutes}m"
    log_message "=========================================="
}

main "$@"
