class Transfer
  attr_accessor :receiver, :sender, :amount, :status

  def initialize(sender,receiver,amount=0)
    @receiver = receiver
    @sender = sender
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction

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
