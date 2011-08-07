class ProductsController < ApplicationController
def create
    @user = User.find(params[:user_id])
    @product = @user.products.create(params[:product])
    redirect_to post_path(@user)
 end
end
