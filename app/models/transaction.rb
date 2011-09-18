class Transaction < ActiveRecord::Base
  belongs_to :Product
  belongs_to :product
  belongs_to :user
end
