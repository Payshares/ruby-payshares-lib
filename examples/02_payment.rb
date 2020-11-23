require 'payshares'

account = Payshares::Account.from_seed("s3fu5vCMrfYouKuk2uB1gCD7EsuuBKY9M4qmnniQMBFMWR6Gaqm") 
client  = Payshares::Client.default_testnet()

# create a random recipients
recipient = Payshares::Account.random

# make a payment
client.send_payment({
  from:   account,
  to:     recipient,
  amount: Payshares::Amount.new(100_000000)
}) # => #<OK>

