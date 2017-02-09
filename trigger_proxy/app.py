import os

import hug
import requests

URL = 'https://api.travis-ci.org/repo/danielnaab%2Fgetitdunn/requests'


@hug.post('/rebuild')
def rebuild(secret):
    secret = secret.decode()
    if os.environ['REBUILD_SECRET'] != secret:
        return secret

    return requests.post(URL, headers={
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Travis-API-Version': '3',
      'Authorization': 'token ' + os.environ['TRAVIS_TOKEN']
    }, data='{"request": {"branch":"master"}}')
