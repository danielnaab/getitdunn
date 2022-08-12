import os

import hug
import requests

URL = "https://api.github.com/repos/danielnaab/getitdunn/dispatches"


@hug.post("/rebuild")
def rebuild(secret):
    if os.environ["REBUILD_SECRET"] != secret:
        return "Permission Denied"

    return requests.post(
        URL,
        headers={
            "Accept": "application/vnd.github+json",
            "Authorization": "token " + os.environ["GH_TOKEN"],
        },
        data='{"event_type":"build-site","client_payload":{}}',
    )
