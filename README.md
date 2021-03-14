# GH Revue

[![Maintainability](https://api.codeclimate.com/v1/badges/c3f01036cb563d5d5b37/maintainability)](https://codeclimate.com/github/ghosteathuman/gh-revue/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/c3f01036cb563d5d5b37/test_coverage)](https://codeclimate.com/github/ghosteathuman/gh-revue/test_coverage)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

### Running the test suite

Ensure that Redis is up and running. Refer to Docker Compose section on how to run Redis.

```bash
$ bundle exec rspec
```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#### Project Creation Command
```
rails new gh-revue --skip-keeps --skip-action-mailbox --skip-action-mailer  --skip-action-text --skip-active-storage --skip-active-record --skip-spring
```
