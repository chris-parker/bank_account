require 'bank_account'

describe Bank_account do
  subject(:bank_account) { described_class.new }

  context 'initialize' do
    it 'initializes with a balance' do
      expect(bank_account.balance).to eq(0)
    end

    it 'initializes with a blank statement' do
      expect(bank_account.print_statement).to eq("date || credit || debit || balance\n")
    end
  end

  context 'deposit' do

    before(:each) do
      bank_account.deposit(1000, "10/01/2012")
    end

    it 'adds to the balance' do
      expect(bank_account.balance).to eq(1000.00)
    end

    it 'adds a line to the statement' do
      expect(bank_account.transactions.last).to eq("10/01/2012 || 1000.00 || || 1000.00")
    end
  end

  context 'withdraw' do

    before(:each) do
      bank_account.deposit(1000, "10/01/2012")
      bank_account.withdraw(500, "14/01/2012")
    end

    it 'takes away from the balance' do
      expect(bank_account.balance).to eq(500.00)
    end

    it 'adds a line to the statement' do
      expect(bank_account.transactions.last).to eq("14/01/2012 || || 500.00 || 500.00")
    end
  end

  context 'print_statement' do
    it 'prints a transaction history' do
      bank_account.deposit(1000, "10/01/2012")
      bank_account.deposit(2000, "13/01/2012")
      bank_account.withdraw(500, "14/01/2012")
      expect(bank_account.print_statement).to eq("date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00")
    end
  end

end
