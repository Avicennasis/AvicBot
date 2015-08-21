#!/usr/bin/python
# -*- coding: utf-8 -*-

# You will need the Python Twitter wrapper found at
# https://github.com/bear/python-twitter
# Released under the Apache License Version 2.0

import twitter
import time
import datetime

# Note you will need to get the keys/tokens from Twitter for your app/account
api = twitter.Api(consumer_key='CKEY',consumer_secret='CS',access_token_key='ATK',access_token_secret='ATS')

ts = time.time()
ggg = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')
status = api.PostUpdate('All Systems Go! ' + ggg)

