class HomeController < ApplicationController
  def index
     @products = Product.all(:order => "RAND()", :limit => 5)
     @product_types = ProductType.all   
    #only keep code here
    #current_user.update_attribute :admin, true

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end

  end
end
