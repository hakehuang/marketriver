class Transaction < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  def self.logtransaction(borrower, lenter, product, status)
    @transaction = Transaction.new
    @transaction.product = product
    @transaction.user  = borrower
    @transaction.trans_stime = Time.now.inspect
    @e = Enumeration.new
    if (status == 1)
    	@e.status = :borrowing
    else
    	@e.status = :borrowing
    end
    @transaction.status = @e
    @transaction.save 
   end
end
