# WebService2

[![Build Status](https://travis-ci.org/mrpatiwi/ACID-webservice2.svg)](https://travis-ci.org/mrpatiwi/ACID-webservice2)

User email and facial recognition validation service built with [Sinatra](http://www.sinatrarb.com/).

## Development

> Make sure you have installed [Ruby 2.3.1](https://www.ruby-lang.org/es/downloads/).

Clone this repository:

```sh
git clone ...
```

Install dependencies:

```sh
bundle install
```

Run web app at [`http://localhost:3000`](http://localhost:3000):

```sh
ruby main.rb
```

## Testing

Check code linting with [rubocop](https://github.com/bbatsov/rubocop):

```sh
# Install rubocop
gem install rubocop

# Run rubocop
rubocop .
```

Run unit tests from [`test`](./test) with:

```sh
rake test
```

> On rake-test warnings, see: https://github.com/brynary/rack-test/pull/116

> In case of gem conflicts, see: http://stackoverflow.com/a/38760385/3416691
