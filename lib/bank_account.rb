class Bank_account

  attr_reader :balance, :statement

  def initialize
    @balance = 0
    @statement = "date || credit || debit || balance"
  end

  def deposit(amount, date)
    @balance += amount
  end

  def withdrawal(amount, date)
    @balance -= amount
  end

end
