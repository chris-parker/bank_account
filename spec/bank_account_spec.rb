require 'bank_account'

describe 'bank_account' do

  it 'initializes with a balance' do
    bank_account = Bank_account.new
    expect(bank_account.balance).to be(nil)
  end

end
