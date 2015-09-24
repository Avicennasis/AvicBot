#!/bin/bash

#On Tool Labs
PYTHONPATH=/shared/pywikipedia/core:/shared/pywikipedia/core/externals/httplib2:/shared/pywikipedia/core/scripts

python /shared/pywikipedia/core/scripts/category.py -family:wikipedia -lang:en listify -from:Wikipedians_who_are_indefinitely_blocked_for_link-spamming -to:User:AvicBot/linkspam -overwrite
python /shared/pywikipedia/core/scripts/category.py -family:wikipedia -lang:en listify -from:Wikipedians_who_are_indefinitely_blocked_for_spamming -to:User:AvicBot/spam -overwrite
python /shared/pywikipedia/core/scripts/category.py -family:wikipedia -lang:en listify -from:Wikipedians_who_are_indefinitely_blocked_for_advertising -to:User:AvicBot/advertising -overwrite
python /shared/pywikipedia/core/scripts/category.py -family:wikipedia -lang:en listify -from:Misplaced_userspace_drafts -to:User:AvicBot/drafts2 -overwrite
python /shared/pywikipedia/core/scripts/category.py -family:wikipedia -lang:en listify -from:G13_eligible_AfC_submissions -to:User:AvicBot/G13 -overwrite
python /shared/pywikipedia/core/scripts/category.py -family:wikipedia -lang:en listify -from:AfC_postponed_G13 -to:User:AvicBot/postponed -overwrite

# These are too large to be used with listify currently
# python /shared/pywikipedia/core/scripts/category.py -family:wikipedia -lang:en listify -from:Wikipedians_who_are_indefinitely_blocked_for_a_violation_of_the_username_policy -to:User:AvicBot/upolvio -overwrite
# python /shared/pywikipedia/core/scripts/category.py -family:wikipedia -lang:en listify -from:User_talk_pages_with_conflict_of_interest_notices -to:User:AvicBot/coi -overwrite
# python /shared/pywikipedia/core/scripts/category.py -family:wikipedia -lang:en listify -from:Stale_userspace_drafts -to:User:AvicBot/drafts -overwrite

