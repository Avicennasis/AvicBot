#!/bin/bash

#On Tool Labs
PYTHONPATH=/shared/pywikipedia/core:/shared/pywikipedia/core/externals/httplib2:/shared/pywikipedia/core/scripts

# Wikivoyages: En, Es, Fa, Ru are all global bot allowed
# As of: August 6th, 2015
# This is meant to run on cron with companion script

if [ $1 == "en" ] || [ $1 == "es" ] || [ $1 == "fa" ] || [ $1 == "ru" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:828
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:15
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:14
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:13
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:12
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:11
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:10
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:9
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:8
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:7
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:6
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:5
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:4
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:3
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:2
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:1
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:0
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:828
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:15
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:14
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:13
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:12
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:11
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:10
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:9
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:8
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:7
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:6
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:5
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:4
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:3
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:2
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:1
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:0
fi

if [ $1 == "en" ] || [ $1 == "es" ]  ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:829
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:829
fi

if [ $1 == "fa" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikivoyage -always -lang:$1 -namespace:106
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikivoyage -always -lang:$1 -namespace:106
fi

