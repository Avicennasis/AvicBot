#!/bin/bash
# =============================================================================
# monitor.sh - Job Monitor
# =============================================================================
#
# Simple monitoring script to watch the job queue (Grid Engine/legacy).
#
# Usage:
#   ./monitor.sh
#
# Note: 'qstat' is specific to Grid Engine environments (Toolforge legacy).
# Modern Toolforge uses 'toolforge-jobs' (Kubernetes). This script remains
# for compatibility with legacy workflows if 'qstat' alias exists.
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Modernized: 2026
# =============================================================================

set -euo pipefail

# Check if qstat exists
if ! command -v qstat &> /dev/null; then
    echo "Error: 'qstat' command not found."
    echo "This script requires a Grid Engine environment or alias."
    exit 1
fi

# Use `watch` instead of an unbounded 1-second loop: it redraws on a sane
# interval and exits cleanly on Ctrl-C / SIGTERM (FR-282).
exec watch -n 5 qstat
