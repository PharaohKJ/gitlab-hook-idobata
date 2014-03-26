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

## Copyright

- Copyright (c) 2014 MICHII Shunske (harukasan)
- License: MIT License (see LICENSE.md)
