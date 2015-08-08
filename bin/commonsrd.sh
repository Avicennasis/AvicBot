#!/bin/bash

#On Tool Labs
PYTHONPATH=/shared/pywikipedia/core:/shared/pywikipedia/core/externals/httplib2:/shared/pywikipedia/core/scripts

# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:1199
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:1198
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:491
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:490
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:461
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:460
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:107
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:106
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:105
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:104
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:103
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:102
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:101
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:100
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:15
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:14
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:13
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:12
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:11
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:10
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:9
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:8
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:7
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:6
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:5
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:4
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:3
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:2
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:1
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -fullscan -always -namespace:0
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:1199
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:1198
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:491
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:490
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:461
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:460
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:107
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:106
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:105
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:104
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:103
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:102
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:101
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:100
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:15
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:14
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:13
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:12
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:11
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:10
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:9
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:8
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:7
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:6
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:5
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:4
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:3
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:2
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:1
python /shared/pywikipedia/core/scripts/redirect.py do -family:commons -lang:commons -always -namespace:0
