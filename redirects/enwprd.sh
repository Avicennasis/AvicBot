#!/bin/bash

PYTHONPATH=/shared/pywikipedia/core:/shared/pywikipedia/core/externals/httplib2:/shared/pywikipedia/core/scripts

date >>~/logs/enwprd.log
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:2600
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:829
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:828
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:711
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:710
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:447
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:119
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:118
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:109
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:108
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:101
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:100
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:15
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:14
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:13
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:12
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:11
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:10
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:9
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:8
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:7
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:6
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:5
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:4
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:3
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:2
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:1
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikipedia -always -lang:en -namespace:0
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:2600
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:829
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:828
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:711
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:710
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:447
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:119
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:118
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:109
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:108
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:101
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:100
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:15
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:14
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:13
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:12
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:11
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:10
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:9
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:8
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:7
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:6
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:5
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:4
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:3
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:2
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:1
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikipedia -always -lang:en -namespace:0

echo "EnWp is done" >>~/logs/enwprd.log
date >>~/logs/enwprd.log

