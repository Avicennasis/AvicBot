#!/bin/bash

#On Tool Labs
PYTHONPATH=/shared/pywikipedia/core:/shared/pywikipedia/core/externals/httplib2:/shared/pywikipedia/core/scripts

python /shared/pywikipedia/core/scripts/category.py -family:wikipedia -lang:en listify -from:Candidates_for_speedy_deletion -to:User:AvicBot/speedy -overwrite
