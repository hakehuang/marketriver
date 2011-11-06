class Product < ActiveRecord::Base
  belongs_to :user
  has_many :DataFiles, :dependent => :destroy
  has_many :Transactions
  validates :cata_level_1,  :presence => true
  validates :cata_level_2,  :presence => true
end
