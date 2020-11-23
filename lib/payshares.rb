require 'payshares-base'
require 'contracts'

module Payshares

  autoload :Account
  autoload :AccountInfo
  autoload :Amount
  autoload :Client

  module Horizon
    extend ActiveSupport::Autoload

    autoload :Problem
    autoload :Result
  end

  autoload :TransactionPage
end
