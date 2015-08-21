#!/bin/bash

#On Tool Labs
PYTHONPATH=/shared/pywikipedia/core:/shared/pywikipedia/core/externals/httplib2:/shared/pywikipedia/core/scripts

#Half hour
python /shared/pywikipedia/core/scripts/category.py -family:wikipedia -lang:en listify -from:Wikipedia_usernames_with_possible_policy_issues  -to:User:Avicennasis/reports/uaa/report -overwrite

