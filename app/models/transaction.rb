class Transaction < ActiveRecord::Base
  has_paper_trail :on => [:update, :destroy]
  belongs_to :product
  belongs_to :user
  validates_columns :status
  def self.logtransaction(borrower, product, status,bc,lc)
    @transaction = Transaction.new
    @transaction.product_id = product
    @transaction.user_id  = borrower
    @transaction.trans_stime = Time.now.inspect
    @transaction.status = :borrowing
    @transaction.borrow_customer = bc
    @transaction.lent_customer = lc
    @transaction.save
   end
end
