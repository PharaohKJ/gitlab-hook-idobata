# gitlab-hook-idobata

gitlab web hook server to notify idobata.

## Feature

- notify push events
- <del>notify issue events</del> (not yet)
- <del>notify merge request events</del> (not yet)

## Usage

### Start hook server:

```
$ git clone git@github.com:harukasan/gitlab-hook-idobata
$ cd gitlab-hook-idobata
$ bundle install --path vendor/bundle
$ cp dotenv .env
$ vim .env # to edit idobata hook url
$ bundle exec foreman start web
```

### Set gitlab hook:

1. open settings page of your repository.
2. Add web hook:

```
  URL: http://$HOST:$PORT/push.json
  Trigger: ✓ Push events
```

#### Or Set gitlab hook: with URL

1. open settings page of your repository.
2. Add web hook: with cgi_escaped_url parameter

```
  URL: http://$HOST:$PORT/push.json?cgi_escaped_url=https%3A%2F%2Fidobata.io%2Fhook%2Fgeneric%2F224f83fc-xxxx-xxxx-xxxx-xxxxxxxxx
  Trigger: ✓ Push events
```

## Copyright

- Copyright (c) 2014 MICHII Shunske (harukasan)
- License: MIT License (see LICENSE.md)
