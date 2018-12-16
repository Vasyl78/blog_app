# Falcon Web

## Setup
```sh
$ git git@github.com:Vasyl78/blog_app.git
$ cd blog_app
$ rvm use ruby-2.5.3
# If you do not have installed this version of ruby please install it.
$ rvm install 2.1.3 # or $ rvm install ruby-2.1.3
$ bundle
$ cp config/database.yml.example config/database.yml
```
```sh
$ rails db:setup
```
```sh
$ rails s
```

### Description
Added base models: Category, Post, Comment.
Writed custom validators.
Used jbuilders for json responses.
Database PostgreSQL.
Writted factories.
