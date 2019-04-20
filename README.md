# Description
This project is made easy to create that Rails on docker.


# Preparation
## Rails new
1. `docker-compose run server rails new . --force --skip-bundle --skip-test --database=mysql`

### Parameter meaning
  * `--force`   
  * `--skip-bundle`
  * `--skip-test`
  * `--database=mysql`


# Build server
  1. `$ docker-compose build`
  2. `$ docker-compose up -d`
  3. Type below on other window
    * `$ docker-compose exec server rails db:create db:migrate`


# How to use when developing
## When chenged Gemfile and Dockerfile
  * `$ docker-compose build`

## Launch server in the backgraund
  * `$ docker-compose up -d`

## Watch server's logs
  * `$ docker-compose logs -f`

