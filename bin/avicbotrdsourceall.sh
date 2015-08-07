#!/bin/bash

#This is our cron script for redirects 
#Paths are formatted for Tool Labs

date >>~/logs/rdsource.log
~/.pywikibot/avicbotrdsource.sh ca
echo "ca done" >>~/logs/rdsource.log
~/.pywikibot/avicbotrdsource.sh el
echo "el done" >>~/logs/rdsource.log
~/.pywikibot/avicbotrdsource.sh fa
echo "fa done" >>~/logs/rdsource.log
~/.pywikibot/avicbotrdsource.sh it
echo "it done" >>~/logs/rdsource.log
~/.pywikibot/avicbotrdsource.sh ko
echo "ko done" >>~/logs/rdsource.log
~/.pywikibot/avicbotrdsource.sh no
echo "no done" >>~/logs/rdsource.log
~/.pywikibot/avicbotrdsource.sh pl
echo "pl done" >>~/logs/rdsource.log
~/.pywikibot/avicbotrdsource.sh vi
echo "vi done" >>~/logs/rdsource.log
~/.pywikibot/avicbotrdsource.sh zh
echo "zh done" >>~/logs/rdsource.log
date >>~/logs/rdsource.log
