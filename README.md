# docker-tutorial

[![Binder](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/ds421/docker-tutorial/master)

## Docker - Local

- Deploy RStudio
- Optional: linking local volumes, starting & stopping containers. `docker exec`. Dockerfiles.

## Docker - Cloud

- Deploy RStudio
- Optional: Docker Compose, Deploy additional containers

## Databases

- See the `[docker-compose.yml](docker-compose.yml)` included here. 

- See [dbplyr Vignette](https://cran.r-project.org/web/packages/dbplyr/vignettes/dbplyr.html).  Most useful is the advice on why you want to use a database:

> - Your data is already in a database.
> - You have so much data that it does not all fit into memory simultaneously and you need to use some external storage engine.
> (If your data fits in memory there is no advantage to putting it in a database: it will only be slower and more frustrating.)

