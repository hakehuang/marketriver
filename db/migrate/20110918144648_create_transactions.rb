class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.date :trans_stime
      t.date :trans_etime
      t.enum :status, :limit => [:borrowing, :confirming, :lenting, :logistic ],:default => :borrowing
      t.references :product
      t.references :user
      t.integer :borrow_customer
      t.integer :lent_customer

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
