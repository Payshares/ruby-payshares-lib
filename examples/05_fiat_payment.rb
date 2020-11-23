require 'payshares'

account = Payshares::Account.from_seed("s3fu5vCMrfYouKuk2uB1gCD7EsuuBKY9M4qmnniQMBFMWR6Gaqm") 
client  = Payshares::Client.default_testnet()

issuer = Payshares::Account.lookup("issuer@haste.co.nz"))
currency = Payshares::Currency.iso4217("USD", issuer)

client.send({
  from:   account,
  to:     recipient,
  amount: Payshares::Amount.new(100, currency, issuer)
}) # => #<OK>