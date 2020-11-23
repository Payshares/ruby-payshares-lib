RSpec::Matchers.define :be_base58_check do |version_byte|
  match do |actual|
    begin
      Payshares::Util::Base58.payshares.check_decode(version_byte, actual)
    rescue ArgumentError
      false
    end
  end
end