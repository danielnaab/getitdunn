In-progress charity race website, built to replace the Wordpress site
[Get It Dunn Run](http://www.getitdunnrun.com). *Not Live Yet*

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

Notes:

[Prismic ruby-kit documentation](http://prismicio.github.io/ruby-kit/Prismic/SearchForm.html)
