class Product < ActiveRecord::Base
  has_many :impressions, :as=>:impressionable
  belongs_to :user
  has_many :DataFiles, :dependent => :destroy
  has_many :Transactions, :dependent => :destroy
  validates :cata_level_1,  :presence => true
  validates :cata_level_2,  :presence => true
  
  def impression_count
    impressions.size
  end

  def unique_impression_count
    impressions.group(:ip_address).size #UNTESTED: might not be correct syntax
  end

end
