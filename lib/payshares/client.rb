require 'hyperclient'

module Payshares
  class Client
    include Contracts

    def self.default(options={})
      new options.merge({
        horizon:   "https://horizon.payshares.org"
      })
    end

    def self.default_testnet(options={})
      new options.merge({
        horizon:   "https://horizon-testnet.payshares.org",
        friendbot: "https://horizon-testnet.payshares.org",
      })
    end

    def self.localhost(options={})
      new options.merge({
        horizon: "http://127.0.0.1:3000", #TODO: figure out a real port
      })
    end

    attr_reader :horizon

    Contract ({horizon: String}) => Any
    def initialize(options)
      @options = options
      @horizon = Hyperclient.new(options[:horizon]) do |client|
        client.faraday_block = lambda do |conn|
          conn.use Faraday::Response::RaiseError
          conn.use FaradayMiddleware::FollowRedirects
          conn.request :url_encoded
          conn.response :hal_json, content_type: /\bjson$/
          conn.adapter :excon
        end
        client.headers = { 
          'Accept' => 'application/hal+json,application/problem+json,application/json' 
        }
      end
    end

    def friendbot(account)
      raise NotImplementedError
    end

    # Contract Payshares::Account => Payshares::AccountInfo
    Contract Payshares::Account => Any
    def account_info(account)
      address  = account.address
      @horizon.account(address:address)
    end

    Contract ({
      from:     Payshares::Account, 
      to:       Payshares::Account, 
      amount:   Payshares::Amount
    }) => Any
    def send_payment(options={})
      from     = options[:from]
      sequence = options[:sequence] || account_info(from).sequence

      payment = Payshares::Transaction.payment({
        account:     from.keypair,
        destination: options[:to].keypair,
        sequence:    sequence + 1,
        amount:      options[:amount].to_payment,
      })

      envelope_hex = payment.to_envelope(from.keypair).to_xdr(:hex)

      @horizon.transactions._post(tx: envelope_hex)
    end

    Contract ({
      account:  Maybe[Payshares::Account],
      limit:    Maybe[Pos]
    }) => TransactionPage
    def transactions(options={})
      args = options.slice(:limit)

      resource = if options[:account]
        args = args.merge(address: options[:account].address)
        @horizon.account_transactions(args)
      else
        @horizon.transactions(args)
      end

      TransactionPage.new(resource)
    end

  end
end