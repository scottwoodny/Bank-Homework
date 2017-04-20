class BankAccount

  @@min_amount = 200

  def initialize(amount,name)
    if amount < @@min_amount
      raise ArgumentError, "Sorry, the minimum opening balance is #{@@min_amount}"
    end
      @amount = amount
      @name = name

  end

  def balance
    @amount
  end

  def deposit(deposit_amount)
    @amount = @amount + deposit_amount
    # @amount += deposit_amount

  end

  def withdrawal(withdrawal_amount)
    # @amount = @amount - withdrawal_amount
    @amount -= withdrawal_amount
  end

  def transfer(transfer_amount, to_account)
    self.withdrawal(transfer_amount)
    to_account.deposit(transfer_amount)
  end

  # def self.min_amount=(amount)
  #   @@min_amount = amount
  # end

  def self.minimum_balance=(amount)
    @@min_amount = amount

  end
end

account1 = BankAccount.new(500,"Sarah")
account2 = BankAccount.new(500,"John")
