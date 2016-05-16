require 'bank_account'

describe 'bank_account' do

  context 'balance' do
    it 'initializes with a balance' do
      bank_account = Bank_account.new
      expect(bank_account.balance).to eq(0)
    end
  end

  context 'deposit' do
    it 'adds to the balance' do
      bank_account = Bank_account.new
      bank_account.deposit(500)
      expect(bank_account.balance).to eq(500)
    end
  end

  context 'withdrawal' do
    it 'takes away from the balance' do
      bank_account = Bank_account.new
      bank_account.deposit(500)
      bank_account.withdrawal(300)
      expect(bank_account.balance).to eq(200)
    end
  end



end
