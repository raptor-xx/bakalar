class CustomersController < ApplicationController
  # GET /customers
  # GET /customers.xml
  
  def index
    @customers = Customer.find_all_by_user_id(session[:user_id], :order => "company")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.xml
  def show
    @customer = Customer.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @customer
      flash[:notice] = 'Tento zákazník neexistuje!'
    redirect_to :action => :index
    return
    end
 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.xml
  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @customer
      flash[:notice] = 'Tento zákazník neexistuje!'
    redirect_to :action => :index
    return
    end
  end

  # POST /customers
  # POST /customers.xml
  def create
    @customer = Customer.new(params[:customer])
    @customer.user_id = session[:user_id]
    

    respond_to do |format|
      if @customer.save
        flash[:notice] = 'Zákazník byl úspěšně vytvořen.'
        format.html { redirect_to(@customer) }
        format.xml  { render :xml => @customer, :status => :created, :location => @customer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.xml
  def update
    @customer = Customer.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @customer
      flash[:notice] = 'Změna zákazníka proběhla neúspěšně!'
    redirect_to :action => :index
    return
    end

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        flash[:notice] = 'Data zákazníka byla úspěšně změněna.'
        format.html { redirect_to(@customer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.xml
  def destroy
    @customer = Customer.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @customer
      flash[:notice] = 'Žádný zákazník nebyl smazán!'
      redirect_to :action => :index
      return
    end
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to(customers_url) }
      format.xml  { head :ok }
    end
  end
end
