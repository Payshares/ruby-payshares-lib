# Ruby Payshares

[![Build Status](https://travis-ci.org/payshares/ruby-payshares-lib.svg)](https://travis-ci.org/payshares/ruby-payshares-lib)
[![Code Climate](https://codeclimate.com/github/payshares/ruby-payshares-lib/badges/gpa.svg)](https://codeclimate.com/github/payshares/ruby-payshares-lib)

*STATUS:  this library is very early and incomplete.  The examples provided do not work, yet*

This library helps you to integrate your application into the [Payshares network](http://payshares.org).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'payshares'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install payshares

Also requires libsodium. Installable via `brew install libsodium` on OS X.

## Usage

See [examples](examples).

A simple payment from the root account to some random accounts

```ruby
require 'payshares'

account   = Payshares::Account.master
client    = Payshares::Client.default_testnet()
recipient = Payshares::Account.random

client.send_payment({
  from:   account,
  to:     recipient,
  amount: Payshares::Amount.new(100_000000)
}) 
```

## Contributing

1. Sign the [Contributor License Agreement](https://docs.google.com/forms/d/1g7EF6PERciwn7zfmfke5Sir2n10yddGGSXyZsq98tVY/viewform?usp=send_form)
2. Fork it ( https://github.com/payshares/ruby-payshares-lib/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
