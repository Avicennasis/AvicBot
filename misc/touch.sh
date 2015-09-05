#!/bin/bash

PYTHONPATH=/shared/pywikipedia/core:/shared/pywikipedia/core/externals/httplib2:/shared/pywikipedia/core/scripts

# Touch cats to remove the empty sub-cats
python /shared/pywikipedia/core/scripts/touch.py -family:commons -lang:commons -subcats:non-empty_category_redirects
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:zh -subcats:尚未清空的已重定向分類
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:wuu -subcats:含有內容嗰已軟重定向分類
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:vi -subcats:Thể_loại_đổi_hướng_không_trống
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:tr -subcats:Boş_olmayan_yönlendirme_kategorileri
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:sl -subcats:Neprazne_preusmeritvene_kategorije
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:simple -subcats:Redirect_categories_with_content
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:sh -subcats:Ne-prazne_preusmjerene_kategorije_Wikipedije
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:sco -subcats:Wikipaedia_nan-empty_soft_redirectit_categories
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:ru -subcats:Переименованные_категории_со_статьями
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:ro -subcats:Categorii_de_redirecționare_populate
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:pt -subcats:!Redirecionamentos_de_categorias_não_vazios
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:ko -subcats:비어_있지_않은_분류_넘겨주기
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:ilo -subcats:Katkategoria_ti_naalumaymay_a_baw-ing_ti_Wikipedia_nga_adda_linaon
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:fr -subcats:Catégorie_redirigée_non_vide
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:es -subcats:Categorías_redirigidas_no_vacías
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:en -subcats:Wikipedia_non-empty_soft_redirected_categories
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:ckb -subcats:پۆلە_ڕەوانەکراوە_نەرمە_ناواڵاکان
python /shared/pywikipedia/core/scripts/touch.py -family:wikipedia -lang:as -subcats:ৱিকিপিডিয়া_খালী_কৰিব_লগীয়া_সৰল_পুনৰ্নিদেশিত_শ্ৰেণীসমূহ


# Extra stuff to poke on Commons
python /shared/pywikipedia/core/scripts/touch.py -family:commons -lang:commons -subcats:Incomplete_deletion_requests_-_missing_subpage
python /shared/pywikipedia/core/scripts/touch.py -family:commons -lang:commons -cat:Incomplete_deletion_requests_-_missing_subpage

