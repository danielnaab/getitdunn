![Build Status](https://travis-ci.org/danielnaab/getitdunn.svg?branch=master)

Charity race website, built for [Get It Dunn Run](http://www.getitdunnrun.com).

# Download Prismic content:

docker-compose run app bundle exec middleman prismic

# Run local webserver at http://localhost:4567
docker-compose up

Uses [Prismic.io](http://prismic.io) for data management. The Prismic schema
will be documented later.

Built with Ruby 2.3.1.

First, download the Prismic-managed content into `./data/`:

```
bundle exec middleman prismic
```

Next, run a local development server:

```
bundle exec middleman server
```

To deploy to Github pages:

```
bundle exec middleman build
bundle exec middleman deploy
```

Notes:

[Prismic ruby-kit documentation](http://prismicio.github.io/ruby-kit/Prismic/SearchForm.html)

The `trigger_proxy` directory includes a Heroku app for proxying TravisCI
webhooks from Prismic.io.
