# Blog APP

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

## Tests

Run tests
```sh
$ rspec
```

Run docs generation
```sh
$ rake docs:generate
```

Open generated docs

  * ubuntu 18.04 chrome
    ```sh
    $ google-chrome doc/api/index.html&
    ```

  * mac OS (not testing)
    ```sh
    $ open doc/api/index.html
    ```


### Description

  * Added base models: Category, Post, Comment.
  * Writed custom validators.
  * Used jbuilders for json responses.
  * Database PostgreSQL.
  * Writted factories.
  * Writted acceptance tests with `rspec_api_documentation` gem.
