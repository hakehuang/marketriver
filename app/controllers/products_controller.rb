class ProductsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /products
  # GET /products.xml
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  def borrow
    @product = Product.find(params[:product]["id"])
    @transact = 0
    
    if (current_user.id != @product.user.id )
	@render = User.find(@product.user_id)
        @borrower = User.find(current_user.id)

	for @customer in @borrower.customers
		if (@customer.credit > 2)
		@customer.credit = @customer.credit - 2
                @transact = 1
		@customer.save
		end  
        end
	if ( @transact == 1)
	 for @customer in @render.customers
		@customer.credit = @customer.credit + 2  
		@customer.save
         end
        @product.status = "Lended"
        @product.save
       redirect_to products_path,:notice => 'you have borrow this products'
        end
    else
       redirect_to products_path,:notice => 'it is your own products'
    end
  end
  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new
    @product.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    if ( @product.user_id != current_user.id)
       redirect_to products_path,:notice => 'You do not own this products'
    end
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])
    @product.user_id = current_user.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
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
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
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
