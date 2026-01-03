#!/bin/bash
# =============================================================================
# touch.sh - Category Touches Script
# =============================================================================
#
# Performs null-edits (touches) on various categories to force MediaWiki
# to update their contents or backlog statuses.
#
# Usage:
#   ./touch.sh
#
# Environment: Wikimedia Toolforge
# Requirements: Pywikibot installed
#
# Author: Léon "Avic" Simmons
# License: MIT License
# Modernized: 2026
# =============================================================================

set -euo pipefail

# =============================================================================
# Configuration
# =============================================================================

readonly PYWIKIBOT_DIR="${PYWIKIBOT_DIR:-/shared/pywikipedia/core}"
readonly TOUCH_SCRIPT="${PYWIKIBOT_DIR}/scripts/touch.py"

# =============================================================================
# Task Definitions
# =============================================================================
# define tasks as: "Family|Lang|ArgType|ArgValue"
# ArgType: -subcats, -cat, -transcludes
# Note: -namespace:14 is appended automatically for -transcludes tasks

readonly TASKS=(
    # --- Empty Sub-cats Cleanup ---
    "commons|commons|-subcats|non-empty_category_redirects"
    "wikipedia|zh|-subcats|尚未清空的已重定向分類"
    "wikipedia|wuu|-subcats|含有內容嗰已軟重定向分類"
    "wikipedia|vi|-subcats|Thể_loại_đổi_hướng_không_trống"
    "wikipedia|tr|-subcats|Boş_olmayan_yönlendirme_kategorileri"
    "wikipedia|sl|-subcats|Neprazne_preusmeritvene_kategorije"
    "wikipedia|simple|-subcats|Redirect_categories_with_content"
    "wikipedia|sh|-subcats|Ne-prazne_preusmjerene_kategorije_Wikipedije"
    "wikipedia|sco|-subcats|Wikipaedia_nan-empty_soft_redirectit_categories"
    "wikipedia|ru|-subcats|Переименованные_категории_со_статьями"
    "wikipedia|ro|-subcats|Categorii_de_redirecționare_populate"
    "wikipedia|pt|-subcats|!Redirecionamentos_de_categorias_não_vazios"
    "wikipedia|ko|-subcats|비어_있지_않은_분류_넘겨주기"
    "wikipedia|ilo|-subcats|Katkategoria_ti_naalumaymay_a_baw-ing_ti_Wikipedia_nga_adda_linaon"
    "wikipedia|fr|-subcats|Catégorie_redirigée_non_vide"
    "wikipedia|es|-subcats|Categorías_redirigidas_no_vacías"
    "wikipedia|en|-subcats|Wikipedia_non-empty_soft_redirected_categories"
    "wikipedia|ckb|-subcats|پۆلە_ڕەوانەکراوە_نەرمە_ناواڵاکان"
    "wikipedia|as|-subcats|ৱিকিপিডিয়া_খালী_কৰিব_লগীয়া_সৰল_পুনৰ্নিদেশিত_শ্ৰেণীসমূহ"

    # --- Commons Maintenance ---
    "commons|commons|-subcats|Incomplete_deletion_requests_-_missing_subpage"
    "commons|commons|-cat|Incomplete_deletion_requests_-_missing_subpage"
    "commons|commons|-subcats|Non-empty_disambiguation_categories"

    # --- Admin Backlogs ---
    "wikipedia|en|-transcludes|admin_backlog"
    "wikipedia|simple|-transcludes|admin_backlog"
    "wikipedia|sa|-transcludes|admin_backlog"
    "wikipedia|ms|-transcludes|admin_backlog"
    "wikipedia|sl|-transcludes|Adminvseznam"
    "wikipedia|vi|-transcludes|BQV_chú_ý"
    
    # --- Generic Backlogs ---
    "commons|commons|-transcludes|backlog"
    "wikipedia|en|-transcludes|backlog"
    "wikipedia|as|-transcludes|backlog"
    "wikipedia|bn|-transcludes|জমা_কাজ"
    "wikipedia|fa|-transcludes|backlog"
    "wikipedia|km|-transcludes|backlog"
    "wikipedia|ms|-transcludes|backlog"
    "wikipedia|or|-transcludes|backlog"
    "wikipedia|sl|-transcludes|Vseznam"
    "wikipedia|rh|-transcludes|backlog"
    "wikipedia|ur|-transcludes|پس_اندراج"
    "wikipedia|zh|-transcludes|backlog"
)

# =============================================================================
# Main Script
# =============================================================================

log_info() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] INFO: $*"
}

main() {
    log_info "Starting touch maintenance run..."
    log_info "Tasks to process: ${#TASKS[@]}"

    for task in "${TASKS[@]}"; do
        # Parse task string (IFS=|)
        IFS='|' read -r family lang arg_type arg_value <<< "${task}"
        
        # Build command
        cmd=(python "${TOUCH_SCRIPT}" -family:"${family}" -lang:"${lang}")
        
        # Handle argument type
        if [[ "${arg_type}" == "-transcludes" ]]; then
            cmd+=("${arg_type}:${arg_value}" -namespace:14)
        else
            cmd+=("${arg_type}:${arg_value}")
        fi
        
        log_info "Processing: ${family}:${lang} ${arg_type}:${arg_value}..."
        
        # Run command, suppress generic output? Maybe keep it for logs.
        "${cmd[@]}" || echo "Warning: Task failed."
    done

    # Double tap for english admin backlog as in original script? 
    # (Original had it twice, maybe intentionally for update propagation?)
    # We'll skip adding the duplicate logic unless strictly necessary to avoid clutter,
    # but the array makes it easy to add if needed.
    
    log_info "Maintenance run complete."
}

main "$@"
