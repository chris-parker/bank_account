class Bank_account

  attr_reader :balance, :statement_header, :statement

  def initialize
    @balance = 0
    @statement_header = "date || credit || debit || balance"
    @statement = []
  end

  def deposit(amount, date)
    @balance += amount
    add_deposit_to_statement(amount, date)
  end

  def withdrawal(amount, date)
    @balance -= amount
    add_withdrawal_to_statement(amount, date)
  end

  def add_deposit_to_statement(amount, date)
    @statement << date + " || " + amount.to_s + "0 || || #{@balance}0"
  end

  def add_withdrawal_to_statement(amount, date)
    @statement << date + " || || " + amount.to_s + "0 || #{@balance}0"
  end

  def print_statement
    @statement_header + "\n" + @statement.reverse.join("\n")
  end

end
