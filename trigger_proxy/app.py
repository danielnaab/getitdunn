import os

import hug
import requests

URL = 'https://api.travis-ci.org/repo/danielnaab%2Fgetitdunn/requests'


@hug.post('/rebuild')
def rebuild(secret):
    if os.environ['REBUILD_SECRET'] != secret:
        return 'Permission Denied'

    return requests.post(URL, headers={
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Travis-API-Version': '3',
      'Authorization': 'token ' + os.environ['TRAVIS_TOKEN']
    }, data='{"request": {"branch":"master"}}')
