class InvoiceOutsController < ApplicationController
  # GET /invoice_outs
  # GET /invoice_outs.xml
  def index
    @invoice_outs = InvoiceOut.find_all_by_user_id(session[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoice_outs }
    end
  end

  # GET /invoice_outs/1
  # GET /invoice_outs/1.xml
  def show
    @invoice_out = InvoiceOut.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @invoice_out
      flash[:notice] = 'Tato faktura neexistuje!'
      redirect_to :action => :index
      return
    end
    @customer = Customer.find(@invoice_out.customer_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice_out }
    end
  end

  # GET /invoice_outs/new
  # GET /invoice_outs/new.xml
  def new
    @invoice_out = InvoiceOut.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoice_out }
    end
  end

  # GET /invoice_outs/1/edit
  def edit
    @invoice_out = InvoiceOut.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @invoice_out
      flash[:notice] = 'Tato faktura neexistuje!'
      redirect_to :action => :index
      return
    end
  end

  # POST /invoice_outs
  # POST /invoice_outs.xml
  def create
    @invoice_out = InvoiceOut.new(params[:invoice_out])
    @invoice_out.user_id = session[:user_id]

    respond_to do |format|
      if @invoice_out.save
        flash[:notice] = 'Faktura byla úspěšně vytvořena.'
        format.html { redirect_to(@invoice_out) }
        format.xml  { render :xml => @invoice_out, :status => :created, :location => @invoice_out }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice_out.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoice_outs/1
  # PUT /invoice_outs/1.xml
  def update
    @invoice_out = InvoiceOut.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @invoice_out
      flash[:notice] = 'Tato faktura neexistuje!'
      redirect_to :action => :index
      return
    end

    respond_to do |format|
      if @invoice_out.update_attributes(params[:invoice_out])
        flash[:notice] = 'Faktura byla úspěšně pozměněna.'
        format.html { redirect_to(@invoice_out) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice_out.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_outs/1
  # DELETE /invoice_outs/1.xml
  def destroy
    @invoice_out = InvoiceOut.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @invoice_out
      flash[:notice] = 'Žádná faktura nebyla smazána!'
      redirect_to :action => :index
      return
    end
    @invoice_out.destroy

    respond_to do |format|
      format.html { redirect_to(invoice_outs_url) }
      format.xml  { head :ok }
    end
  end
end
