class Bank_account

  attr_reader :balance, :statement

  def initialize
    @balance = 0
    @statement = ["date || credit || debit || balance"]
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
    @statement << date + " || " + amount.to_s + " || || #{@balance}"
  end

  def add_withdrawal_to_statement(amount, date)
    @statement << date + " || || " + amount.to_s + " || #{@balance}"
  end

end
