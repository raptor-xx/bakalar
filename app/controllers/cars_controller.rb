class CarsController < ApplicationController
  # GET /cars
  # GET /cars.xml
  def index
    @cars = Car.find_all_by_user_id(session[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cars }
    end
  end

  # GET /cars/1
  # GET /cars/1.xml
  def show
    @car = Car.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @car
      flash[:notice] = 'Toto auto neexistuje!'
    redirect_to :action => :index
    return
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @car }
    end
  end

  # GET /cars/new
  # GET /cars/new.xml
  def new
    @car = Car.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @car }
    end
  end

  # GET /cars/1/edit
  def edit
    @car = Car.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @car
      flash[:notice] = 'Toto auto neexistuje!'
    redirect_to :action => :index
    return
    end
  end

  # POST /cars
  # POST /cars.xml
  def create
    @car = Car.new(params[:car])
    @car.user_id = session[:user_id]
    
    respond_to do |format|
      if @car.save
        flash[:notice] = 'Auto bylo úspěšně vytvořeno.'
        format.html { redirect_to(@car) }
        format.xml  { render :xml => @car, :status => :created, :location => @car }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @car.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cars/1
  # PUT /cars/1.xml
  def update
    @car = Car.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @car
      flash[:notice] = 'Změna auta proběhla neúspěšně!'
    redirect_to :action => :index
    return
    end

    respond_to do |format|
      if @car.update_attributes(params[:car])
        flash[:notice] = 'Auto bylo úspěšně aktualizováno.'
        format.html { redirect_to(@car) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @car.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.xml
  def destroy
    @car = Car.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @car
      flash[:notice] = 'Žádné auto nebylo smazáno!'
      redirect_to :action => :index
      return
    end
    @car.destroy

    respond_to do |format|
      format.html { redirect_to(cars_url) }
      format.xml  { head :ok }
    end
  end
end
