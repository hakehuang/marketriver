class ProductCataloge < ActiveRecord::Base
  belongs_to :product_type
 def tname
    I18n.t("#{product_type.name.to_s}.#{name.to_s}")
 end
end
