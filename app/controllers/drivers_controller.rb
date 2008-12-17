class DriversController < ApplicationController
  # GET /drivers
  # GET /drivers.xml
  def index
    @drivers = Driver.find_all_by_user_id(session[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @drivers }
    end
  end

  # GET /drivers/1
  # GET /drivers/1.xml
  def show
    @driver = Driver.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @driver
      flash[:notice] = 'Tento řidič neexistuje!'
    redirect_to :action => :index
    return
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @driver }
    end
  end

  # GET /drivers/new
  # GET /drivers/new.xml
  def new
    @driver = Driver.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @driver }
    end
  end

  # GET /drivers/1/edit
  def edit
    @driver = Driver.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @driver
      flash[:notice] = 'Tento řidič neexistuje!'
    redirect_to :action => :index
    return
    end
  end

  # POST /drivers
  # POST /drivers.xml
  def create
    @driver = Driver.new(params[:driver])
    @driver.user_id = session[:user_id]

    respond_to do |format|
      if @driver.save
        flash[:notice] = 'Řidič byl úspěšně vytvořen.'
        format.html { redirect_to(@driver) }
        format.xml  { render :xml => @driver, :status => :created, :location => @driver }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @driver.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /drivers/1
  # PUT /drivers/1.xml
  def update
    @driver = Driver.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @driver
      flash[:notice] = 'Změna řidiče proběhla neúspěšně!'
    redirect_to :action => :index
    return
    end

    respond_to do |format|
      if @driver.update_attributes(params[:driver])
        flash[:notice] = 'Data řidiče byla úspěšně změněna.'
        format.html { redirect_to(@driver) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @driver.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.xml
  def destroy
    @driver = Driver.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @driver
      flash[:notice] = 'Žádný řidič nebyl smazán!'
      redirect_to :action => :index
      return
    end
    @driver.destroy

    respond_to do |format|
      format.html { redirect_to(drivers_url) }
      format.xml  { head :ok }
    end
  end
end
