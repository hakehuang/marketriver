class ProductCatalogesController < ApplicationController
  #before_filter :isadmin
 def create
    @product_type = ProductType.find(params[:product_type_id])
    @product_cataloge = @product_type.product_cataloges.create(params[:product_cataloge])
    redirect_to product_type_path(@product_type)
 end

 def destroy
    @product_type = ProductType.find(params[:product_type_id])
    @product_cataloge = @product_type.product_cataloges.find(params[:id])
    @product_cataloge.destroy
    redirect_to product_type_path(@product_type)
  end

end
