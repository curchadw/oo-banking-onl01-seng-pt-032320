class Transfer
  attr_accessor :receiver, :sender, :amount, :status

  def initialize(sender,receiver,amount=0)
    @receiver = receiver
    @sender = sender
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.balance > @amount && @status == 'pending'
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'completed'
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status ='reversed'
    else
      nil
    end
  end


end
