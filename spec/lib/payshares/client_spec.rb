require "spec_helper"

describe Payshares::Client, ".localhost" do
  subject{ Payshares::Client.localhost }

  it{ should be_a(Payshares::Client) }
end