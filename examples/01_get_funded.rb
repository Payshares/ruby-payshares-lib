require 'payshares'

# Reference an account from a secret seed
account = Payshares::Account.from_seed("s3fu5vCMrfYouKuk2uB1gCD7EsuuBKY9M4qmnniQMBFMWR6Gaqm") 
 
# Further options
# 
# Make a random account
# 
#   account = Payshares::Account.random()
#
# Reference an account (unauthenticated) from an address
# 
#   account = Payshares::Account.from_address("gjgPNE2GpySt5iYZaFFo1svCJ4gbHwXxUy8DDqeYTDK6UzsPTs")
#
# Reference an account (unauthenticated) from a federation name
# 
#   account = Payshares::Account.lookup("nullstyle") # defaults to payshares.org
#   account = Payshares::Account.lookup("nullstyle@payshares.org")
# 

# create a connection to the payshares network
client = Payshares::Client.default_testnet()

# Further options
# 
# Connect to the live network (when it is created)
# 
#   client = Payshares::Client.default
# 
# Connect to a specific horizon host
# 
#   client = Payshares::Client.new(host: "127.0.0.1")

# Get our friendly friendbot to
# fund your new account
response = client.friendbot(account)  # => #<OK>
