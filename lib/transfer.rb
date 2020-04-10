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


end
