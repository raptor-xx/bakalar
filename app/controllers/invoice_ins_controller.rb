class InvoiceInsController < ApplicationController
  # GET /invoice_ins
  # GET /invoice_ins.xml
  def index
    @invoice_ins = InvoiceIn.find_all_by_user_id(session[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoice_ins }
    end
  end

  # GET /invoice_ins/1
  # GET /invoice_ins/1.xml
  def show
    @invoice_in = InvoiceIn.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @invoice_in
      flash[:notice] = 'Tato faktura neexistuje!'
      redirect_to :action => :index
      return
    end
    @customer = Customer.find(@invoice_in.customer_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice_in }
    end
  end

  # GET /invoice_ins/new
  # GET /invoice_ins/new.xml
  def new
    @invoice_in = InvoiceIn.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoice_in }
    end
  end

  # GET /invoice_ins/1/edit
  def edit
    @invoice_in = InvoiceIn.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @invoice_in
      flash[:notice] = 'Tato faktura neexistuje!'
      redirect_to :action => :index
      return
    end
  end

  # POST /invoice_ins
  # POST /invoice_ins.xml
  def create
    @invoice_in = InvoiceIn.new(params[:invoice_in])
    @invoice_in.user_id = session[:user_id]

    respond_to do |format|
      if @invoice_in.save
        flash[:notice] = 'Faktura byla úspěšně vytvořena.'
        format.html { redirect_to(@invoice_in) }
        format.xml  { render :xml => @invoice_in, :status => :created, :location => @invoice_in }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice_in.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoice_ins/1
  # PUT /invoice_ins/1.xml
  def update
    @invoice_in = InvoiceIn.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @invoice_in
      flash[:notice] = 'Tato faktura neexistuje!'
      redirect_to :action => :index
      return
    end

    respond_to do |format|
      if @invoice_in.update_attributes(params[:invoice_in])
        flash[:notice] = 'Faktura byla úspěšně pozměněna.'
        format.html { redirect_to(@invoice_in) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice_in.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_ins/1
  # DELETE /invoice_ins/1.xml
  def destroy
    @invoice_in = InvoiceIn.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @invoice_in
      flash[:notice] = 'Žádná faktura nebyla smazána!'
      redirect_to :action => :index
      return
    end
    @invoice_in.destroy

    respond_to do |format|
      format.html { redirect_to(invoice_ins_url) }
      format.xml  { head :ok }
    end
  end
end
