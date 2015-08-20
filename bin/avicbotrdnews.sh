#!/bin/bash

#On Tool Labs
PYTHONPATH=/shared/pywikipedia/core:/shared/pywikipedia/core/externals/httplib2:/shared/pywikipedia/core/scripts

# Wikinewses: Ar, Bg, Bs, Ca, Cs, El, En, Eo, Fa, Fi, He, Ja, Ko, No, Pt, Ro, Ru, Sq, Sr, Sv, Ta, Tr, Uk, Zh are all global bot allowed
# As of: August 6th, 2015
# This is meant to run on cron with companion script

if [ $1 == "ar" ] || [ $1 == "bg" ] || [ $1 == "bs" ] || [ $1 == "ca" ] || [ $1 == "cs" ] || [ $1 == "el" ] || [ $1 == "en" ] || [ $1 == "eo" ] || [ $1 == "fa" ] || [ $1 == "fi" ] || [ $1 == "he" ] || [ $1 == "ja" ] || [ $1 == "ko" ] || [ $1 == "no" ] || [ $1 == "pt" ] || [ $1 == "ro" ] || [ $1 == "ru" ] || [ $1 == "sq" ] || [ $1 == "sr" ] || [ $1 == "sv" ] || [ $1 == "ta" ] || [ $1 == "tr" ] || [ $1 == "uk" ] || [ $1 == "zh" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:14
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:12
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:11
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:10
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:9
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:8
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:5
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:4
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:3
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:2
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:1
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:0
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:14
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:12
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:11
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:10
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:9
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:8
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:5
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:4
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:3
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:2
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:1
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:0
fi

if [ $1 == "ar" ] || [ $1 == "bg" ] || [ $1 == "bs" ] || [ $1 == "cs" ] || [ $1 == "el" ] || [ $1 == "en" ] || [ $1 == "fa" ] || [ $1 == "fi" ] || [ $1 == "he" ] || [ $1 == "ja" ] || [ $1 == "ko" ] || [ $1 == "no" ] || [ $1 == "pt" ] || [ $1 == "ro" ] || [ $1 == "ru" ] || [ $1 == "sr" ] || [ $1 == "sv" ] || [ $1 == "tr" ] || [ $1 == "uk" ] || [ $1 == "zh" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:6
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:6
fi

if [ $1 == "bg" ] || [ $1 == "en" ] || [ $1 == "fi" ] || [ $1 == "he" ] || [ $1 == "ja" ] || [ $1 == "pt" ] || [ $1 == "ru" ] || [ $1 == "sv" ] || [ $1 == "zh" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:7
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:7
fi

if [ $1 == "cs" ] || [ $1 == "en" ] || [ $1 == "fi" ] || [ $1 == "he" ] || [ $1 == "pt" ] || [ $1 == "ru" ] || [ $1 == "zh" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:13
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:13
fi

if [ $1 == "ar" ] || [ $1 == "ca" ] || [ $1 == "cs" ] || [ $1 == "el" ] || [ $1 == "en" ] || [ $1 == "eo" ] || [ $1 == "fa" ] || [ $1 == "fi" ] || [ $1 == "he" ] || [ $1 == "ja" ] || [ $1 == "ko" ] || [ $1 == "no" ] || [ $1 == "pt" ] || [ $1 == "ro" ] || [ $1 == "ru" ] || [ $1 == "sr" ] || [ $1 == "sv" ] || [ $1 == "ta" ] || [ $1 == "tr" ] || [ $1 == "uk" ] || [ $1 == "zh" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:15
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:15
fi

if [ $1 == "en" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:90
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:92
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:90
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:92
fi

if [ $1 == "ar" ] || [ $1 == "ca" ] || [ $1 == "en" ] || [ $1 == "fa" ] || [ $1 == "he" ] || [ $1 == "ja" ] || [ $1 == "no" ] || [ $1 == "pt" ] || [ $1 == "ru" ] || [ $1 == "sq" ] || [ $1 == "ta" ] || [ $1 == "tr" ] || [ $1 == "zh" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:100
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:100
fi

if [ $1 == "ar" ] || [ $1 == "en" ] || [ $1 == "fa" ] || [ $1 == "he" ] || [ $1 == "ja" ] || [ $1 == "no" ] || [ $1 == "pt" ] || [ $1 == "ru" ] || [ $1 == "ta" ] || [ $1 == "tr" ] || [ $1 == "zh" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:101
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:101
fi

if [ $1 == "ar" ] || [ $1 == "bg" ] || [ $1 == "ca" ] || [ $1 == "el" ] || [ $1 == "en" ] || [ $1 == "fa" ] || [ $1 == "pt" ] || [ $1 == "ru" ] || [ $1 == "sq" ] || [ $1 == "sr" ] || [ $1 == "uk" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:102
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:102
fi

if [ $1 == "pt" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:103
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:103
fi

if [ $1 == "uk" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:104
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:104
fi

if [ $1 == "no" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:106
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:107
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:106
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:107
fi

if [ $1 == "ja" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:108
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:109
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:108
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:109
fi

if [ $1 == "ca" ] || [ $1 == "cs" ] || [ $1 == "en" ] || [ $1 == "fa" ] || [ $1 == "ro" ] || [ $1 == "ru" ] || [ $1 == "uk" ] || [ $1 == "zh" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:828
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:828
fi

if [ $1 == "cs" ] || [ $1 == "uk" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikinews -always -lang:$1 -namespace:829
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikinews -always -lang:$1 -namespace:829
fi
