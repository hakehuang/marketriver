class ProductType < ActiveRecord::Base
 validates :name,  :presence => true
 has_many :product_cataloges, :dependent => :destroy
 def tname
    I18n.t("#{name.to_s}.#{name.to_s}")
 end
end
