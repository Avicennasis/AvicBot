#!/bin/bash

# This is our cron script for redirects 
# Paths are formatted for Tool Labs

date >>~/logs/rdvoyage.log
~/.pywikibot/avicbotrdvoyage.sh en
echo "en done" >>~/logs/rdvoyage.log
~/.pywikibot/avicbotrdvoyage.sh es
echo "es done" >>~/logs/rdvoyage.log
~/.pywikibot/avicbotrdvoyage.sh fa
echo "fa done" >>~/logs/rdvoyage.log
~/.pywikibot/avicbotrdvoyage.sh ru
echo "ru done" >>~/logs/rdvoyage.log
date >>~/logs/rdvoyage.log

