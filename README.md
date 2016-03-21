# git2consul-docker

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-0.12.7-blue.svg)](https://hub.docker.com/r/devth/git2consul/tags/)

Automated Dockerfile build repository for devth/git2consul.

## Local repo

A volume exists at `/repo`. You can mount a git repo directly into that volume,
and use it to populate your Consul instance. For example, given a git2consul
config:

```json
{
  "version": "1.0",
  "repos" : [{
    "include_branch_name" : false,
    "name" : "consul-config",
    "url" : "file:///repo/.git",
    "branches" : ["master"],
    "hooks": [{
      "type" : "polling",
      "interval" : "1"
    }]
  }]
}
```

You could run this in the root dir of a git repo on your machine, or e.g. in a
Jenkins build:

```
docker run \
  -v `pwd`:/repo \
  --rm --name git2consul \
  devth/git2consul --endpoint $ENDPOINT
```


## Build

```
docker build -t devth/git2consul .
```

## License

Copyright (c) 2016 Trevor C. Hartman. Distributed under the [MIT
License](LICENSE).

