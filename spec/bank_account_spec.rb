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
      bank_account.deposit(500.00, "16/05/2016")
      expect(bank_account.balance).to eq(500.00)
    end

    it 'adds a line to the statement' do
      bank_account = Bank_account.new
      bank_account.deposit(500.00, "16/05/2016")
      expect(bank_account.statement.last).to eq("16/05/2016 || 500.00 || || 500.00")
    end
  end

  context 'withdrawal' do
    it 'takes away from the balance' do
      bank_account = Bank_account.new
      bank_account.deposit(500.00, "16/05/2016")
      bank_account.withdrawal(300.00, "16/05/2016")
      expect(bank_account.balance).to eq(200.00)
    end

    it 'adds a line to the statement' do
      bank_account = Bank_account.new
      bank_account.deposit(500.00, "16/05/2016")
      bank_account.withdrawal(300.00, "16/05/2016")
      expect(bank_account.statement.last).to eq("16/05/2016 || || 300.00 || 200.00")
    end
  end

  context 'statement' do
    it 'initializes with a blank statement' do
      bank_account = Bank_account.new
      expect(bank_account.statement_header).to eq("date || credit || debit || balance")
    end

    it 'prints a transaction history' do
      bank_account = Bank_account.new
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
