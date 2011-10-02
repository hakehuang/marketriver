class HomeController < ApplicationController
  def index
     @products = Product.all(:order => "RAND()", :limit => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end

  end
end
