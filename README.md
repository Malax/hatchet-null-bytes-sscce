## Circle CI "double null byte" issue SSCCE

## Docker

This suite will successfully complete in docker. It's using the same base image as the CircleCI job!

```
$ docker build .
$ docker run --env HEROKU_API_USER=$(heroku whoami) --env HEROKU_API_KEY=$(heroku auth:token) $IMAGE_ID
```

## CircleCI CLI

The same suite will consistently fail here. This is also true on CircleCI itself:

```
$ brew install circleci
$ circleci local execute --job hatchet --env HEROKU_API_USER=$(heroku whoami) --env HEROKU_API_KEY=$(heroku auth:token)
```
