#!/bin/bash
# =============================================================================
# mysandboxes.sh - Sandbox Cleaner Orchestrator
# =============================================================================
#
# Runs the mysandboxes.py script for multiple languages to reset public sandboxes.
#
# Usage:
#   ./mysandboxes.sh
#
# Environment: Wikimedia Toolforge
# Requirements: mysandboxes.py in configuration path
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Modernized: 2026
# =============================================================================

set -euo pipefail

# =============================================================================
# Configuration
# =============================================================================

# Path to the python script (assumes deployed to ~/.pywikibot/ or similar)
# Fallback to local misc/ directory if not found
if [[ -f "${HOME}/.pywikibot/mysandboxes.py" ]]; then
    readonly SANDBOX_SCRIPT="${HOME}/.pywikibot/mysandboxes.py"
else
    # Fallback for development/testing
    readonly SANDBOX_SCRIPT="$(dirname "$0")/mysandboxes.py"
fi

# List of languages/families to process
# Format: "lang [family]"
readonly TASKS=(
    "en"
    "eo"
    "sco"
    "simple"
    "commons commons"
    "meta meta"
)

# =============================================================================
# Main Script
# =============================================================================

log_info() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] INFO: $*"
}

main() {
    if [[ ! -f "${SANDBOX_SCRIPT}" ]]; then
        echo "Error: Script not found at ${SANDBOX_SCRIPT}" >&2
        exit 1
    fi

    log_info "Starting sandbox cleaning run..."

    for task in "${TASKS[@]}"; do
        # Split task string into args
        read -r lang family <<< "${task}"
        
        # Construct arguments
        args=(-lang:"${lang}")
        if [[ -n "${family:-}" ]]; then
            args+=(-family:"${family}")
        fi

        log_info "Processing ${lang} ${family:-}..."
        python "${SANDBOX_SCRIPT}" "${args[@]}" || {
            echo "Warning: Failed to process ${lang} ${family:-}" >&2
        }
    done

    log_info "Sandbox cleaning run complete."
}

main "$@"
