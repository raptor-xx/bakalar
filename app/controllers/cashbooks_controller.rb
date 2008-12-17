class CashbooksController < ApplicationController
  # GET /cashbooks
  # GET /cashbooks.xml
  def index
    @cashbooks = Cashbook.find_all_by_user_id(session[:user_id])
    #@customers = Customer.find_all_by_user_id(session[:user_id]).map { |c| c.id => c.company }
    @movement = ['Příjem', 'Výdej'] 
    @where =  ['Pokladna', 'Banka'] 
    @DPH = ['Žádné DPH', '5%', '19%']

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cashbooks }
    end
  end

  # GET /cashbooks/1
  # GET /cashbooks/1.xml
  def show
    @cashbook = Cashbook.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @cashbook
      flash[:notice] = 'Tato položka není v peněžním deníku!'
      redirect_to :action => :index
      return
    end
    @customer = Customer.find(@cashbook.customer_id)
    @movement = ['Příjem', 'Výdej'] 
    @where =  ['Pokladna', 'Banka'] 
    @DPH = ['Žádné DPH', '5%', '19%']

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cashbook }
    end
  end

  # GET /cashbooks/new
  # GET /cashbooks/new.xml
  def new
    @cashbook = Cashbook.new
    @customers = Customer.find_all_by_user_id(session[:user_id]).map { |c| [c.company, c.id]  }
    @movement = [['Příjem', 0], ['Výdej', 1]] 
    @where =  [['Pokladna', 0], ['Banka', 1]] 
    @DPH = [['Žádné DPH', 0], ['5%', 1], ['19%', 2]]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cashbook }
    end
  end

  # GET /cashbooks/1/edit
  def edit
    @cashbook = Cashbook.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @cashbook
      flash[:notice] = 'Tato položka není v peněžním deníku!'
      redirect_to :action => :index
      return
    end
    @customer = Customer.find_all_by_user_id(session[:user_id]).map { |c| [c.company, c.id]  }
    @movement = [['Příjem', 0], ['Výdej', 1]] 
    @where =  [['Pokladna', 0], ['Banka', 1]] 
    @DPH = [['Žádné DPH', 0], ['5%', 1], ['19%', 2]]
  end

  # POST /cashbooks
  # POST /cashbooks.xml
  def create
    @cashbook = Cashbook.new(params[:cashbook])
    @cashbook.user_id = session[:user_id]

    respond_to do |format|
      if @cashbook.save
        flash[:notice] = 'Položka v peněžním deníku byla úspěšně vytvořena.'
        format.html { redirect_to(@cashbook) }
        format.xml  { render :xml => @cashbook, :status => :created, :location => @cashbook }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cashbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cashbooks/1
  # PUT /cashbooks/1.xml
  def update
    @cashbook = Cashbook.find(params[:id])

    respond_to do |format|
      if @cashbook.update_attributes(params[:cashbook])
        flash[:notice] = 'Cashbook was successfully updated.'
        format.html { redirect_to(@cashbook) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cashbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cashbooks/1
  # DELETE /cashbooks/1.xml
  def destroy
    @cashbook = Cashbook.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @cashbook
      flash[:notice] = 'Tato položka není v peněžním deníku!'
      redirect_to :action => :index
      return
    end
    @cashbook.destroy

    respond_to do |format|
      format.html { redirect_to(cashbooks_url) }
      format.xml  { head :ok }
    end
  end
end
