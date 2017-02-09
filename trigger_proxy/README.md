# trigger_proxy

This will trigger a TravisCI rebuild from a Prismic.io webhook POST.

Heroku configuration provided, since a free tier deployment works for this use.

This only exists only because Prismic.io doesn't support passing http headers
to webhooks.

## Run test server

```
hug -p 8000 -f app.py
```
