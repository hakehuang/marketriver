class HomeController < ApplicationController
  def index
    #@products = Product.all(:order => "RAND()", :limit => 5)
    #@products = Product.where("cata_level_1 = :type", :type => 1).all(:order => "RAND()", :limit => 10)
    @product_types = ProductType.all 
    @home_page = 1
    @products_div = [] 
    @product_types.each do |pd|
    @products_div[pd.id]  = Product.where("cata_level_1 = :type", :type => pd.id ).all(:order => "RAND()", :limit => 5)
    end
    #only keep code here
    #current_user.update_attribute :admin, true

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end

  end
end
