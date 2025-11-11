import requests, sys, webbrowser, bs4 

print('Googling...') # display text while downloading the search result page
res = requests.get('https://pypi.org/search/?q={}'.format(' '.join(sys.argv[1:])))
res.raise_for_status()
# TODO: Retrieve top search result links.

# TODO: Open a browser tab for each result.