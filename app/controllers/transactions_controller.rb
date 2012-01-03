class TransactionsController < ApplicationController
  before_filter :authenticate_user!
  # GET /transactions
  # GET /transactions.xml
  def index
    @transactions = Transaction.all.paginate(:page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.xml
  def show
    @transaction = Transaction.find(params[:id])
    @borrow_mail = User.find_by_id(@transaction.user_id).email
    if ! @transaction.borrow_customer.nil?
    @bc = Customer.find_by_id(@transaction.borrow_customer) 
    end
    if ! @transaction.lent_customer.nil?
    @lc = Customer.find_by_id(@transaction.lent_customer) 
    end
    if ! @transaction.product_id.nil?
    @pd = Product.find_by_id(@transaction.product_id) 
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.xml
  def new
    if params[:product_id].nil?
       redirect_to products_path,:notice => 'Can not access this directly'
    else
    	@transaction = Transaction.new
    	respond_to do |format|
      		format.html # new.html.erb
      		format.xml  { render :xml => @transaction }
    	end
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
    @pd = Product.find(@transaction.product_id) 
    if (current_user.id != @transaction.product.user.id ) \
	and (current_user.id != @transaction.user.id )
       redirect_to products_path,:notice => t(:noauth)
    else
       @lc = User.find_by_id(@transaction.product.user.id).customers
       @bc = User.find_by_id(@transaction.user.id).customers
    end
  end

  # POST /transactions
  # POST /transactions.xml
  def create
    @transaction = Transaction.new(params[:transaction])

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to(@transaction, :notice => 'Transaction was successfully created.') }
        format.xml  { render :xml => @transaction, :status => :created, :location => @transaction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.xml
  def update
    @transaction = Transaction.find(params[:id])
    @pd = Product.find(@transaction.product_id) 
    if (current_user.id != @transaction.product.user.id ) \
	and (current_user.id != @transaction.user.id )
       redirect_to products_path,:notice => t(:noauth)
    else
       @lc = User.find_by_id(@transaction.product.user.id).customers
       @bc = User.find_by_id(@transaction.user.id).customers
       Notifier.update(current_user,@pd).deliver
       Notifier.update( @transaction.product.user, @pd).deliver
    end
        
    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        format.html { redirect_to(@transaction, :notice => t(:successupdatetrans)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.xml
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to(transactions_url) }
      format.xml  { head :ok }
    end
  end
end
