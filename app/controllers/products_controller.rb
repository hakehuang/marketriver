class ProductsController < ApplicationController
def create
    @user = User.find(params[:user_id])
    @product = @user.products.create(params[:product])
    redirect_to user_path(@user)
 end
 def destroy
    @user = User.find(params[:user_id])
    @product = @user.products.find(params[:id])
    @product.destroy
    redirect_to user_path(@user)
  end
end
