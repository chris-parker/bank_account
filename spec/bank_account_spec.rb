require 'bank_account'

describe Bank_account do
  subject(:bank_account) { described_class.new }

  context 'balance' do
    it 'initializes with a balance' do
      expect(bank_account.balance).to eq(0)
    end
  end

  context 'deposit' do
    it 'adds to the balance' do
      bank_account.deposit(1000.00, "10/01/2012")
      expect(bank_account.balance).to eq(1000.00)
    end

    it 'adds a line to the statement' do
      bank_account.deposit(1000.00, "10/01/2012")
      expect(bank_account.transactions.last).to eq("10/01/2012 || 1000.00 || || 1000.00")
    end
  end

  context 'withdrawal' do
    it 'takes away from the balance' do
      bank_account.deposit(1000.00, "10/01/2012")
      bank_account.withdrawal(500.00, "14/01/2012")
      expect(bank_account.balance).to eq(500.00)
    end

    it 'adds a line to the statement' do
      bank_account.deposit(1000.00, "10/01/2012")
      bank_account.withdrawal(500.00, "14/01/2012")
      expect(bank_account.transactions.last).to eq("14/01/2012 || || 500.00 || 500.00")
    end
  end

  context 'print_statement' do
    it 'initializes with a blank statement' do
      expect(bank_account.print_statement).to eq("date || credit || debit || balance\n")
    end

    it 'prints a transaction history' do
      bank_account.deposit(1000.00, "10/01/2012")
      bank_account.deposit(2000.00, "13/01/2012")
      bank_account.withdrawal(500.00, "14/01/2012")
      expect(bank_account.print_statement).to eq("date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00")
    end
  end

end
