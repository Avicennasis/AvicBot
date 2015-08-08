#!/bin/bash

# Wikisources: Ca, El, Fa, It, Ko, No, Pl, Vi, Zh are all global bot allowed
# As of: August 6th, 2015
# This is meant to run on cron with compaion script

PYTHONPATH=/shared/pywikipedia/core:/shared/pywikipedia/core/externals/httplib2:/shared/pywikipedia/core/scripts

if [ $1 == "ca" ] || [ $1 == "el" ] || [ $1 == "fa" ] || [ $1 == "it" ] || [ $1 == "ko" ] || [ $1 == "no" ] || [ $1 == "pl" ] || [ $1 == "vi" ] || [ $1 == "zh" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:103
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:102
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:15
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:14
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:12
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:11
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:10
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:9
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:8
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:5
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:4
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:3
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:2
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:1
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:0
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:103
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:102
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:15
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:14
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:12
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:11
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:10
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:9
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:8
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:5
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:4
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:3
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:2
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:1
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:0
fi

if [ $1 == "ca" ] || [ $1 == "el" ] || [ $1 == "it" ] || [ $1 == "ko" ] || [ $1 == "no" ] || [ $1 == "pl" ] || [ $1 == "vi" ] || [ $1 == "zh" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:6
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:6
fi

if [ $1 == "ca" ] || [ $1 == "el" ] || [ $1 == "fa" ] || [ $1 == "it" ] || [ $1 == "ko" ] || [ $1 == "pl" ] || [ $1 == "zh" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:7
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:7
fi

if [ $1 == "el" ] || [ $1 == "it" ] || [ $1 == "no" ] || [ $1 == "pl" ] || [ $1 == "zh" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:13
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:13
fi

if [ $1 == "el" ] || [ $1 == "fa" ] || [ $1 == "ko" ] || [ $1 == "pl" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:100
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:101
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:100
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:101
fi

if [ $1 == "ca" ] || [ $1 == "fa" ] || [ $1 == "it" ] || [ $1 == "no" ] || [ $1 == "pl" ] || [ $1 == "vi" ] || [ $1 == "zh" ] ; then
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:104
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:104
fi

if [ $1 == "ca" ] || [ $1 == "it" ] || [ $1 == "no" ] || [ $1 == "pl" ] || [ $1 == "vi" ] || [ $1 == "zh" ] ; then
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:105
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:105
fi

if [ $1 == "ca" ] || [ $1 == "fa" ] || [ $1 == "it" ] || [ $1 == "no" ] || [ $1 == "vi" ] || [ $1 == "zh" ] ; then
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:106
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:106
fi

if [ $1 == "ca" ] || [ $1 == "it" ] || [ $1 == "no" ] || [ $1 == "vi" ] || [ $1 == "zh" ] ; then
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:107
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:107
fi

if [ $1 == "el" ] || [ $1 == "it" ] || [ $1 == "zh" ] ; then
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:108
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:108
fi

if [ $1 == "el" ] || [ $1 == "it" ] ; then
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:109
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:109
fi

if [ $1 == "it" ] ; then
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:110
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:111
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:112
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:110
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:111
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:112
fi

if [ $1 == "zh" ] ; then
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:114
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:115
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:114
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:115
fi

if [ $1 == "ko" ] ; then
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:250
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:252
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:250
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:252
fi

if [ $1 == "ca" ] || [ $1 == "el" ] || [ $1 == "fa" ] || [ $1 == "it" ] || [ $1 == "ko" ] || [ $1 == "pl" ] || [ $1 == "vi" ] || [ $1 == "zh" ] ; then
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:828
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:828
fi

if [ $1 == "it" ] ; then
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikisource -always -lang:$1 -namespace:829
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikisource -always -lang:$1 -namespace:829
fi

