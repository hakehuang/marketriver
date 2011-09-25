class Product < ActiveRecord::Base
  belongs_to :user
  has_many :DataFiles, :dependent => :destroy
  has_many :Transactions
end
