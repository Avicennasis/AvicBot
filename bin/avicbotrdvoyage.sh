#!/bin/bash

#On Tool Labs
PYTHONPATH=/shared/pywikipedia/core:/shared/pywikipedia/core/externals/httplib2:/shared/pywikipedia/core/scripts

# En, Es, Fa, Ru are all global bot allowed
# This is meant to run on cron with compaion script

if [ $1 == "en" ] || [ $1 == "es" ] || [ $1 == "fa" ] || [ $1 == "ru" ] ; then
# Try a full scan first
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:828
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:15
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:14
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:13
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:12
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:11
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:10
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:9
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:8
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:7
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:6
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:5
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:4
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:3
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:2
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:1
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:0
# Pull from special page, in case full scan fails
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:828
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:15
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:14
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:13
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:12
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:11
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:10
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:9
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:8
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:7
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:6
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:5
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:4
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:3
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:2
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:1
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:0
fi

if [ $1 == "en" ] || [ $1 == "es" ]  ; then
# Try a full scan first
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:829
# Pull from special page, in case full scan fails
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:829
fi

if [ $1 == "fa" ] ; then
# Try a full scan first
python pwb.py redirect -fullscan do -family:wikivoyage -always -lang:$1 -namespace:106
# Pull from special page, in case full scan fails
python pwb.py redirect do -family:wikivoyage -always -lang:$1 -namespace:106
fi
