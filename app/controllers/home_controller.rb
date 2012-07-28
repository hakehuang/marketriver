class HomeController < ApplicationController
  #impressionist :actions=>[:index] 
  def index
    #@products = Product.all(:order => "RAND()", :limit => 5)
    #@products = Product.where("cata_level_1 = :type", :type => 1).all(:order => "RAND()", :limit => 10)
    @product_types = ProductType.all 
    @home_page = 1
    @products_div = [] 
    @product_types.each do |pd|
    @products_div[pd.id]  = Product.where("cata_level_1 = :type", :type => pd.id ).all(:order => "RAND()", :limit => 0)
    end
    @producs_prompt = Product.where("prompt = :pr", :pr => true).all(:order => "RAND()", :limit => 30)
    #only keep code here
    #current_user.update_attribute :admin, true
    #logger.debug "debugging" + @@cnt.to_s
    @counter = Counter.all
    if @counter.length == 0 
      @counter = Counter.new
      @counter.number = 1688
    else
      @counter.first.number += 1
    end
    @counter.first.save
    @icnt = @counter.first.number
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end
end
