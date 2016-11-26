#!/usr/bin/env python
# -*- coding: utf-8 -*-

import urllib2
import json
import re

def apiRequest(query):
	enpoint = 'https://ru.wikiquote.org/w/api.php?utf8=1&'
	req = urllib2.Request(enpoint+query)
	req.add_header('Accept', 'application/json')
	response = urllib2.urlopen(req)
	return json.loads(response.read(), 'utf-8')

def getRandomQuote():
	random = apiRequest('action=query&format=json&list=random&rnnamespace=0&rnlimit=100')
	for item in random['query']['random']:
		page = apiRequest('action=parse&format=json&pageid={}&prop=wikitext&noimages=1'.format(item['id']))
		text = page['parse']['wikitext']['*']
		matches = re.findall(r'{{Q\|([^\n\'=|[<{]+)\|.*}}', text, re.UNICODE)
		for match in matches:
			if match and 30 <= len(match) <= 80:
				return match
	return ''

print getRandomQuote().encode('utf-8')
