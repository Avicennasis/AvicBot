#!/bin/bash

#On Tool Labs
PYTHONPATH=/shared/pywikipedia/core:/shared/pywikipedia/core/externals/httplib2:/shared/pywikipedia/core/scripts

# Wikiquotes: Af, Ar, Az, Be, Bg, Br, Bs, Ca, Cs, Cy, Da, El, Eo, Es, Et, Eu, Fa, Fi, Fr, Gl, Gu, He, Hi, Hu, Hy, Id, Is, It, Ja, Ka, Kn, Ko, Ku, Ky, La, Li, Lt, Ml, Mr, Nl, Nn, No, Pt, Ro, Ru, Sk, Sl, Sq, Sr, Su, Sv, Ta, Te, Tr, Uk, Ur, Uz, Vi, Wo, Zh are all global bot allowed
# As of: August 6th, 2015
# This is meant to run on cron with companion script

if [ $1 == "af" ] || [ $1 == "ar" ] || [ $1 == "az" ] || [ $1 == "be" ] || [ $1 == "bg" ] || [ $1 == "br" ] || [ $1 == "bs" ] || [ $1 == "ca" ] || [ $1 == "cs" ] || [ $1 == "cy" ] || [ $1 == "da" ] || [ $1 == "el" ] || [ $1 == "eo" ] || [ $1 == "es" ] || [ $1 == "et" ] || [ $1 == "eu" ] || [ $1 == "fa" ] || [ $1 == "fi" ] || [ $1 == "fr" ] || [ $1 == "gl" ] || [ $1 == "gu" ] || [ $1 == "he" ] || [ $1 == "hi" ] || [ $1 == "hu" ] || [ $1 == "hy" ] || [ $1 == "id" ] || [ $1 == "is" ] || [ $1 == "it" ] || [ $1 == "ja" ] || [ $1 == "ka" ] || [ $1 == "kn" ] || [ $1 == "ko" ] || [ $1 == "ku" ] || [ $1 == "ky" ] || [ $1 == "la" ] || [ $1 == "li" ] || [ $1 == "lt" ] || [ $1 == "ml" ] || [ $1 == "mr" ] || [ $1 == "nl" ] || [ $1 == "nn" ] || [ $1 == "no" ] || [ $1 == "pt" ] || [ $1 == "ro" ] || [ $1 == "ru" ] || [ $1 == "sk" ] || [ $1 == "sl" ] || [ $1 == "sq" ] || [ $1 == "sr" ] || [ $1 == "su" ] || [ $1 == "sv" ] || [ $1 == "ta" ] || [ $1 == "te" ] || [ $1 == "tr" ] || [ $1 == "uk" ] || [ $1 == "ur" ] || [ $1 == "uz" ] || [ $1 == "vi" ] || [ $1 == "wo" ] || [ $1 == "zh" ]  ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:14
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:10
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:8
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:5
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:4
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:3
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:2
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:1
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:0
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:14
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:10
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:8
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:5
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:4
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:3
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:2
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:1
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:0
fi

if [ $1 == "ar" ] || [ $1 == "az" ] || [ $1 == "bg" ] || [ $1 == "bs" ] || [ $1 == "ca" ] || [ $1 == "cs" ] || [ $1 == "da" ] || [ $1 == "el" ] || [ $1 == "eo" ] || [ $1 == "et" ] || [ $1 == "fa" ] || [ $1 == "fi" ] || [ $1 == "he" ] || [ $1 == "hu" ] || [ $1 == "hy" ] || [ $1 == "id" ] || [ $1 == "is" ] || [ $1 == "it" ] || [ $1 == "ja" ] || [ $1 == "ka" ] || [ $1 == "ko" ] || [ $1 == "ku" ] || [ $1 == "la" ] || [ $1 == "lt" ] || [ $1 == "ml" ] || [ $1 == "mr" ] || [ $1 == "nl" ] || [ $1 == "nn" ] || [ $1 == "no" ] || [ $1 == "pt" ] || [ $1 == "ro" ] || [ $1 == "ru" ] || [ $1 == "sk" ] || [ $1 == "sl" ] || [ $1 == "sq" ] || [ $1 == "sr" ] || [ $1 == "su" ] || [ $1 == "sv" ] || [ $1 == "ta" ] || [ $1 == "te" ] || [ $1 == "tr" ] || [ $1 == "ur" ] || [ $1 == "uz" ] || [ $1 == "vi" ] || [ $1 == "zh" ]  ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:6
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:6
fi

if [ $1 == "ar" ] || [ $1 == "bs" ] || [ $1 == "ca" ] || [ $1 == "da" ] || [ $1 == "el" ] || [ $1 == "he" ] || [ $1 == "hu" ] || [ $1 == "it" ] || [ $1 == "ka" ] || [ $1 == "ru" ] || [ $1 == "sk" ] || [ $1 == "tr" ] || [ $1 == "vi" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:7
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:7
fi

if [ $1 == "af" ] || [ $1 == "ar" ] || [ $1 == "az" ] || [ $1 == "bg" ] || [ $1 == "br" ] || [ $1 == "bs" ] || [ $1 == "ca" ] || [ $1 == "cs" ] || [ $1 == "cy" ] || [ $1 == "da" ] || [ $1 == "el" ] || [ $1 == "eo" ] || [ $1 == "es" ] || [ $1 == "et" ] || [ $1 == "eu" ] || [ $1 == "fa" ] || [ $1 == "fi" ] || [ $1 == "fr" ] || [ $1 == "gl" ] || [ $1 == "gu" ] || [ $1 == "he" ] || [ $1 == "hi" ] || [ $1 == "hu" ] || [ $1 == "hy" ] || [ $1 == "id" ] || [ $1 == "is" ] || [ $1 == "it" ] || [ $1 == "ja" ] || [ $1 == "ka" ] || [ $1 == "kn" ] || [ $1 == "ko" ] || [ $1 == "ku" ] || [ $1 == "ky" ] || [ $1 == "la" ] || [ $1 == "lt" ] || [ $1 == "ml" ] || [ $1 == "mr" ] || [ $1 == "nl" ] || [ $1 == "nn" ] || [ $1 == "no" ] || [ $1 == "pt" ] || [ $1 == "ro" ] || [ $1 == "ru" ] || [ $1 == "sk" ] || [ $1 == "sl" ] || [ $1 == "sq" ] || [ $1 == "sr" ] || [ $1 == "sv" ] || [ $1 == "tr" ] || [ $1 == "uk" ] || [ $1 == "ur" ] || [ $1 == "vi" ] || [ $1 == "zh" ]  ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:9
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:9
fi

if [ $1 == "af" ] || [ $1 == "ar" ] || [ $1 == "az" ] || [ $1 == "bg" ] || [ $1 == "br" ] || [ $1 == "bs" ] || [ $1 == "ca" ] || [ $1 == "cs" ] || [ $1 == "da" ] || [ $1 == "el" ] || [ $1 == "es" ] || [ $1 == "et" ] || [ $1 == "fa" ] || [ $1 == "fi" ] || [ $1 == "fr" ] || [ $1 == "gl" ] || [ $1 == "he" ] || [ $1 == "hi" ] || [ $1 == "hu" ] || [ $1 == "hy" ] || [ $1 == "id" ] || [ $1 == "is" ] || [ $1 == "it" ] || [ $1 == "ja" ] || [ $1 == "ka" ] || [ $1 == "ko" ] || [ $1 == "no" ] || [ $1 == "pt" ] || [ $1 == "ro" ] || [ $1 == "ru" ] || [ $1 == "sk" ] || [ $1 == "sl" ] || [ $1 == "sq" ] || [ $1 == "sr" ] || [ $1 == "sv" ] || [ $1 == "ta" ] || [ $1 == "tr" ] || [ $1 == "uk" ] || [ $1 == "uz" ] || [ $1 == "vi" ] || [ $1 == "zh" ]  ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:11
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:11
fi

if [ $1 == "ar" ] || [ $1 == "az" ] || [ $1 == "bg" ] || [ $1 == "bs" ] || [ $1 == "ca" ] || [ $1 == "cs" ] || [ $1 == "cy" ] || [ $1 == "da" ] || [ $1 == "el" ] || [ $1 == "es" ] || [ $1 == "fa" ] || [ $1 == "fi" ] || [ $1 == "fr" ] || [ $1 == "gl" ] || [ $1 == "gu" ] || [ $1 == "he" ] || [ $1 == "hu" ] || [ $1 == "hy" ] || [ $1 == "id" ] || [ $1 == "is" ] || [ $1 == "it" ] || [ $1 == "ja" ] || [ $1 == "ka" ] || [ $1 == "kn" ] || [ $1 == "ko" ] || [ $1 == "ku" ] || [ $1 == "ky" ] || [ $1 == "la" ] || [ $1 == "lt" ] || [ $1 == "ml" ] || [ $1 == "mr" ] || [ $1 == "nl" ] || [ $1 == "nn" ] || [ $1 == "no" ] || [ $1 == "pt" ] || [ $1 == "ro" ] || [ $1 == "ru" ] || [ $1 == "sk" ] || [ $1 == "sl" ] || [ $1 == "sq" ] || [ $1 == "sr" ] || [ $1 == "su" ] || [ $1 == "sv" ] || [ $1 == "ta" ] || [ $1 == "te" ] || [ $1 == "tr" ] || [ $1 == "uk" ] || [ $1 == "vi" ] || [ $1 == "zh" ]  ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:12
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:12
fi

if [ $1 == "ar" ] || [ $1 == "bg" ] || [ $1 == "ca" ] || [ $1 == "es" ] || [ $1 == "fi" ] || [ $1 == "fr" ] || [ $1 == "he" ] || [ $1 == "id" ] || [ $1 == "it" ] || [ $1 == "ka" ] || [ $1 == "ro" ] || [ $1 == "ru" ] || [ $1 == "sk" ] || [ $1 == "tr" ] || [ $1 == "uk" ] || [ $1 == "ur" ] || [ $1 == "vi" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:13
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:13
fi

if [ $1 == "ar" ] || [ $1 == "be" ] || [ $1 == "bg" ] || [ $1 == "bs" ] || [ $1 == "ca" ] || [ $1 == "cs" ] || [ $1 == "da" ] || [ $1 == "el" ] || [ $1 == "es" ] || [ $1 == "et" ] || [ $1 == "eu" ] || [ $1 == "fa" ] || [ $1 == "fi" ] || [ $1 == "fr" ] || [ $1 == "gl" ] || [ $1 == "he" ] || [ $1 == "hu" ] || [ $1 == "hy" ] || [ $1 == "id" ] || [ $1 == "is" ] || [ $1 == "it" ] || [ $1 == "ja" ] || [ $1 == "ka" ] || [ $1 == "ko" ] || [ $1 == "ku" ] || [ $1 == "lt" ] || [ $1 == "ml" ] || [ $1 == "nl" ] || [ $1 == "pt" ] || [ $1 == "ru" ] || [ $1 == "sk" ] || [ $1 == "sr" ] || [ $1 == "sv" ] || [ $1 == "te" ] || [ $1 == "tr" ] || [ $1 == "uk" ] || [ $1 == "vi" ] ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:15
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:15
fi

if [ $1 == "cs" ] || [ $1 == "sk" ] || [ $1 == "zh" ]  ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:100
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:100
fi

if [ $1 == "cs" ] || [ $1 == "he" ] || [ $1 == "sk" ] || [ $1 == "zh" ]  ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:101
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:101
fi

if [ $1 == "fr" ]  ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:108
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:105
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:104
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:103
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:102
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:108
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:105
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:104
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:103
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:102
fi

if [ $1 == "bs" ] || [ $1 == "ca" ] || [ $1 == "cs" ] || [ $1 == "el" ] || [ $1 == "eo" ] || [ $1 == "es" ] || [ $1 == "fa" ] || [ $1 == "fr" ] || [ $1 == "hy" ] || [ $1 == "id" ] || [ $1 == "it" ] || [ $1 == "nl" ] || [ $1 == "no" ] || [ $1 == "pt" ] || [ $1 == "ru" ] || [ $1 == "ta" ] || [ $1 == "te" ] || [ $1 == "tr" ] || [ $1 == "ur" ] || [ $1 == "vi" ] || [ $1 == "zh" ]  ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:828
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:828
fi

if [ $1 == "ca" ] || [ $1 == "it" ]  ; then
# Try a full scan first
python /shared/pywikipedia/core/scripts/redirect.py -fullscan do -family:wikiquote -always -lang:$1 -namespace:829
# Pull from special page, in case full scan fails
python /shared/pywikipedia/core/scripts/redirect.py do -family:wikiquote -always -lang:$1 -namespace:829
fi

