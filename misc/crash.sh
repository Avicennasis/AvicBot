#!/bin/bash

#On Tool Labs
PYTHONPATH=/shared/pywikipedia/core:/shared/pywikipedia/core/externals/httplib2:/shared/pywikipedia/core/scripts

python /shared/pywikipedia/core/scripts/add_text.py -family:wikipedia -lang:en -page:"User:AvicBot/crashlog" -text:"==Notice==\nAvicBot Wikimedia Tool Labs server has crashed and restarted. ~~~~" -summary:Notice -always

