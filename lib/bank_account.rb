class Bank_account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date)
    @balance += amount
    add_deposit_to_transactions(amount, date)
  end

  def withdraw(amount, date)
    @balance -= amount
    add_withdrawal_to_transactions(amount, date)
  end

  def print_statement
    "date || credit || debit || balance\n" + @transactions.reverse.join("\n")
  end

  private

  def add_deposit_to_transactions(amount, date)
    @transactions << date + " || #{sprintf("%.2f", amount)} || || #{sprintf("%.2f", @balance)}"
  end

  def add_withdrawal_to_transactions(amount, date)
    @transactions << date + " || || #{sprintf("%.2f", amount)} || #{sprintf("%.2f", @balance)}"
  end

end
