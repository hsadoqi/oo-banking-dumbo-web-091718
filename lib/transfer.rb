require 'pry'
class Transfer
  # your code here
  attr_reader :receiver, :sender
  attr_accessor :amount, :status

  def initialize(sender, receiver, amount)
    @receiver = receiver
    @sender = sender
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if @status == "pending" && @sender.balance > @amount
        @receiver.balance += @amount
        @sender.balance -= @amount
        @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    # binding.pry
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
