class Transaction < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates_columns :status
  def self.logtransaction(borrower, product, status)
    @transaction = Transaction.new
    @transaction.product_id = product
    @transaction.user_id  = borrower
    @transaction.trans_stime = Time.now.inspect
    @e = Transaction.new
    if (status == 1)
    	@e.status = :borrowing
    else
    	@e.status = :borrowing
    end
    @transaction.status = @e
    @transaction.save 
   end
end
