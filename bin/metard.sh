#!/bin/bash

#On Tool Labs
PYTHONPATH=/shared/pywikipedia/core:/shared/pywikipedia/core/externals/httplib2:/shared/pywikipedia/core/scripts

# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:2600
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:1199
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:1198
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:867
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:866
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:829
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:828
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:487
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:486
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:485
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:471
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:470
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:209
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:208
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:207
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:206
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:205
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:204
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:203
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:202
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:201
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:200
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:15
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:14
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:13
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:12
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:11
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:10
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:9
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:8
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:7
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:6
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:5
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:4
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:3
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:2
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:1
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -fullscan -always -namespace:0
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:2600
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:1199
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:1198
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:867
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:866
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:829
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:828
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:487
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:486
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:485
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:471
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:470
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:209
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:208
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:207
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:206
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:205
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:204
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:203
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:202
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:201
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:200
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:15
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:14
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:13
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:12
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:11
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:10
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:9
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:8
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:7
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:6
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:5
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:4
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:3
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:2
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:1
python /shared/pywikipedia/core/scripts/redirect.py do -family:meta -lang:meta -always -namespace:0
