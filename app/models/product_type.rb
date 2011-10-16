class ProductType < ActiveRecord::Base
 validates :name,  :presence => true
 has_many :product_cataloges, :dependent => :destroy
end
