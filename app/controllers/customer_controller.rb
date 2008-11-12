class CustomerController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @customer_pages, @customers = paginate :customers, :per_page => 10, 
                                  :conditions => { :user_id => session[:user_id] }
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params[:customer])
    @customer.user_id = session[:user_id]
    if @customer.save
      flash[:notice] = 'Zákazník byl úspěšně vytvořen.'
      redirect_to :action => 'list'
    else
      flash[:notice] = 'Chyba při vytváření.'
      render :action => 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.user_id == session[:user_id] and @customer.update_attributes(params[:customer])
      flash[:notice] = 'Zákazník byl úspěšně změněn.'
      redirect_to :action => 'show', :id => @customer
    else
      flash[:notice] = 'Chyba při editaci.'
      render :action => 'edit'
    end
  end

  def destroy
    Customer.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
