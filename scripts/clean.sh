#!/bin/bash
# =============================================================================
# clean.sh - Log Cleanup Utility
# =============================================================================
#
# Cleans up temporary log files and error reports from the home directory.
# Designed to be run periodically via cron to prevent disk clutter.
#
# Usage:
#   ./clean.sh
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Modernized: 2026
# =============================================================================

set -euo pipefail

# =============================================================================
# Configuration
# =============================================================================

readonly LOG_DIR="${HOME}/logs"
readonly HOME_DIR="${HOME}"

# List of patterns/files to remove from HOME directory
readonly HOME_FILES=(
    "service.manifest"
    "service.log"
    "error.log"
    "access.log"
    "uaa*.out"
    "uaa*.err"
    "clean.out"
    "clean.err"
    "metard.err"
    "commonscat.out"
    "mysandboxes.err"
    "avicbotrdsourceall.err"
    "categories.err"
    "rdallsource.err"
    "login.err"
    "rdallvoy.err"
    "avicbotirc2.err"
    "avicbotirc2.out"
    "avicbotrdnewsall.err"
    "categories.out"
    "commonsrd.err"
    "commonsrd.out"
    "csd.err"
    "csd.out"
    "enorphans.out"
)

# =============================================================================
# Main Script
# =============================================================================

log_info() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] INFO: $*"
}

main() {
    log_info "Starting cleanup..."

    # Clean legacy logs in logs/ directory
    if [[ -d "${LOG_DIR}" ]]; then
        log_info "Cleaning .del files in ${LOG_DIR}..."
        # Using find to properly handle no-match cases
        find "${LOG_DIR}" -maxdepth 1 -name "*.del" -delete
    fi

    # Clean files in HOME directory
    log_info "Cleaning temporary files in ${HOME_DIR}..."
    for pattern in "${HOME_FILES[@]}"; do
        # Use find to handle wildcards safely and avoid errors if files don't exist
        find "${HOME_DIR}" -maxdepth 1 -name "${pattern}" -delete
    done

    log_info "Cleanup complete."
}

main "$@"
