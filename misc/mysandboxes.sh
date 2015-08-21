#!/bin/bash

#On Tool Labs
PYTHONPATH=/shared/pywikipedia/core:/shared/pywikipedia/core/externals/httplib2:/shared/pywikipedia/core/scripts

python ~/.pywikibot/mysandboxes.py -lang:en
python ~/.pywikibot/mysandboxes.py -lang:eo
python ~/.pywikibot/mysandboxes.py -lang:sco
python ~/.pywikibot/mysandboxes.py -lang:simple
python ~/.pywikibot/mysandboxes.py -lang:commons -family:commons
python ~/.pywikibot/mysandboxes.py -lang:meta -family:meta

