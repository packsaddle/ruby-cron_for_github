# CronForGithub

[![Gem Version](http://img.shields.io/gem/v/cron_for_github.svg?style=flat)](http://badge.fury.io/rb/cron_for_github)
[![Build Status](http://img.shields.io/travis/packsaddle/ruby-cron_for_github/master.svg?style=flat)](https://travis-ci.org/packsaddle/ruby-cron_for_github)

## Usage

**Cron for GitHub**, Kick GitHub by creating branch. This also wakes *web-hooks* up!

```
$ cron-for-github ping --slug=YOU/YOUR_REPO
```

After few seconds, your repo has a new branch `cron_for_github/da0535a2-9523-42e3-bae2-a2e682b2f437`.
`da0535a2-9523-42e3-bae2-a2e682b2f437` is uuid.

## Easy to use

[Cron for GitHub on Heroku](https://github.com/packsaddle/ruby-cron_for_github-app)

## Command

```
Commands:
  cron-for-github clear --slug=SLUG  # Delete cron branches
  cron-for-github help [COMMAND]     # Describe available commands or one specific command
  cron-for-github ping --slug=SLUG   # Kick cron
  cron-for-github version            # Show the CronForGithub version

Usage:
  cron-for-github ping --slug=SLUG

Options:
  [--debug], [--no-debug]
  [--verbose], [--no-verbose]
  --slug=SLUG
  [--namespace=NAMESPACE]
                               # Default: cron_for_github
  [--base=BASE]
                               # Default: master

Kick cron

Usage:
  cron-for-github clear --slug=SLUG

Options:
  [--debug], [--no-debug]
  [--verbose], [--no-verbose]
  --slug=SLUG
  [--namespace=NAMESPACE]
                               # Default: cron_for_github

Delete cron branches
```

## VS.

### [traviscron.pythonanywhere.com](http://traviscron.pythonanywhere.com/)

Good service for Travis-CI. This requires form submitting, and only for Travis-CI.

### [Tachikoma.io](http://tachikoma.io)

Dependency Update as a Service.
This is only dependency update, so problem specific SaaS.
If you NEVER want to maintenance your server (include Heroku), Tachikoma.io suits you.

### [zapier](https://zapier.com/)/[ifttt](https://ifttt.com/)

I don't know how to achieve yet.

### Build periodically travis-ci/travis-ci

We solve this! :)
[Build periodically travis-ci/travis-ci](https://github.com/travis-ci/travis-ci/issues/582)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cron_for_github'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cron_for_github

## Requirement

Set `GITHUB_ACCESS_TOKEN=__your_access_token__` to your environment variable.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec cron_for_github` to use the code located in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/ruby-cron_for_github/cron_for_github/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
