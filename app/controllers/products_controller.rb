class ProductsController < ApplicationController
  before_filter :authenticate_user!
  # GET /products
  # GET /products.xml
  def index
    #@products = Product.all
    @products = Product.paginate(:page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end
  
  def find_title
    @products_name = Product.where("name LIKE :name", :name => "%" + params[:title][:name] + "%").all
    @products_title = Product.where("title LIKE :title", :title => "%" + params[:title][:name] + "%").all
    @products = (@products_name + @products_title).uniq.paginate(:page => params[:page])
  end

  def search
    @products = Product.where("cata_level_1 = :type AND cata_level_2 = :cata",{ :type => params[:pt] ,:cata =>  params[:pc] }).paginate(:page => params[:page])
    render 'products/index'
  end

  def borrow
    @product = Product.find(params[:product]["id"])
    @transact = 1
    @bc = nil
    @lc = nil
    @ss = 0    

    @product.Transactions.each do |t|
      if (t.user_id == current_user.id) and (t.status != :lenting)
        @ss = 1
       end 
    end
    
    if @ss
      redirect_to products_path,:notice => t(:transactexist)
    else
     if (current_user.id != @product.user.id )
	@render = User.find(@product.user_id)
        @borrower = User.find(current_user.id)

        if @borrower.customers
	@bc=@borrower.customers.first
        end
        if  @render.customers
        @lc = @render.customers.first
        end
	#for @customer in @borrower.customers
		#if (@customer.credits > 2)
		#@customer.credits = @customer.credits - 2
                #@transact = 1
		#@customer.save
		#end  
        #end
	# if ( @transact == 1)
	# for @customer in @render.customers
	#	@customer.credits = @customer.credits + 2  
	#	@lc=@customer.id
        #        @customer.save
        # end
        #@product.save
        Transaction.logtransaction(current_user.id,@product.id, 1, @bc,@lc)
        	redirect_to products_path,:notice => t(:transactsubmit)
        #else
	#	redirect_to products_path,:notice => 'you can not borrow this product'
        #end
      else
       redirect_to products_path,:notice => t(:selfproduct)
     end
    end
  end
  # GET /products/1
  # GET /products/1.xml
  def show
    if params[:id].nil? 
     redirect_to products_path
    end
    
    @product = Product.find(params[:id])
    @status = [ [t(:available),:available],[t(:lent), :lent],[t(:soldout), :soldout] ]
    @sharemode = [ [t(:for_free),:for_free],[t(:for_rent), :for_rent],[t(:for_sale), :for_sale] ]
     #code to recover old bug
    #if(@product.status.to_i != 1 && @product.status.to_i != 2 && @product.status.to_i != 3)
    #  @product.status = "1"
    #end  
 
    if ( @product.cata_level_1 )
      @product_type = ProductType.find(@product.cata_level_1)
      @cata_level1_name = @product_type.tname
      if ( @product.cata_level_2  )
      	@cata_level2_name = ProductCataloge.find(@product.cata_level_2).tname
      else
        @cata_level2_name = "undefined"
      end
    else
       @cata_level1_name = "undefined"
        @cata_level2_name = "undefined"
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
    rescue
      @cata_level1_name = "Undefined"
      @cata_level2_name = "Undefined"
      #flash[:notice] = "Wrong post it"
      #redirect_to :action => 'index'
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new
    @product.user_id = current_user.id
    
    @catalog1_list = ProductType.all
    @catalog2_list = ProductCataloge.all 
    @isnew = true 
    @sharemode = [ [t(:for_free),:for_free],[t(:for_rent), :for_rent],[t(:for_sale), :for_sale] ]
    @status = [ [t(:available),:available],[t(:lent), :lent],[t(:soldout), :soldout] ]
     
 #  @catalog1s = ProductType.all
 #  @catalog1_list = []
 #  for @item in @catalog1s
 #      @name = @item.name.to_s
 #      @catalog1_list += [t(@name + "." + @name)]
 #  end
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  def update_cata_level_2
    @catalog1_list = ProductType.find(params[:cata_level_1])    
    @catalog2_list = @catalog1_list.product_cataloges
    
  end
  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @catalog1_list = ProductType.all
    if ( @product.cata_level_1 )
     @catalog2_list = ProductCataloge.where("product_type_id = :type " , :type => @product.cata_level_1 ).all
    else
     @catalog2_list = ProductCataloge.all
    end
 
    @current_cata1 = @product.cata_level_1
    @current_cata2 = @product.cata_level_2    
 
    @sharemode = [ [t(:for_free),:for_free],[t(:for_rent), :for_rent],[t(:for_sale), :for_sale] ]
    @status = [ [t(:available),:available],[t(:lent), :lent],[t(:soldout), :soldout] ]
    if ( @product.user_id != current_user.id)
       redirect_to products_path,:notice => t(:notyours)
    end
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])
    @product.user_id = current_user.id

    @catalog1_list = ProductType.all
    @catalog2_list = ProductCataloge.all
 
    @current_cata1 = @product.cata_level_1
    @current_cata2 = @product.cata_level_2
    @sharemode = [ [t(:for_free),:for_free],[t(:for_rent), :for_rent],[t(:for_sale), :for_sale] ]
    @status = [ [t(:available),:available],[t(:lent), :lent],[t(:soldout), :soldout] ]
    respond_to do |format|
      if @product.save
        format.html { redirect_to edit_product_path(@product) , :notice => t(:successshare) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        @isnew = 1
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])
 
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => t(:successupdate)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
end
