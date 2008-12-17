class JourneysController < ApplicationController
  # GET /journeys
  # GET /journeys.xml
  def index
    @journeys = Journey.find_all_by_user_id(session[:user_id])
    @cars = Car.find_all_by_user_id(session[:user_id])
    @drivers = Driver.find_all_by_user_id(session[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @journeys }
    end
  end

  # GET /journeys/1
  # GET /journeys/1.xml
  def show
    @journey = Journey.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @journey
      flash[:notice] = 'Tato služební cesta neexistuje!'
      redirect_to :action => :index
      return
    end
    @car = Car.find(@journey.car_id)
    @driver = Driver.find(@journey.driver_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @journey }
    end
  end

  # GET /journeys/new
  # GET /journeys/new.xml
  def new
    @journey = Journey.new
    @cars = Car.find_all_by_user_id(session[:user_id]).map { |c| [c.SPZ, c.id]  }
    @drivers = Driver.find_all_by_user_id(session[:user_id]).map { |d| [d.personal_id, d.id]  }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @journey }
    end
  end

  # GET /journeys/1/edit
  def edit
    @journey = Journey.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @journey
      flash[:notice] = 'Tato služební cesta neexistuje!'
      redirect_to :action => :index
      return
    end
    @cars = Car.find_all_by_user_id(session[:user_id]).map { |c| [c.SPZ, c.id]  }
    @drivers = Driver.find_all_by_user_id(session[:user_id]).map { |d| [d.personal_id, d.id]  }
  end

  # POST /journeys
  # POST /journeys.xml
  def create
    @journey = Journey.new(params[:journey])
    @journey.user_id = session[:user_id]

    respond_to do |format|
      if @journey.save
        flash[:notice] = 'Služební cesta byla úspěšně vytvořena.'
        format.html { redirect_to(@journey) }
        format.xml  { render :xml => @journey, :status => :created, :location => @journey }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @journey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /journeys/1
  # PUT /journeys/1.xml
  def update
    @journey = Journey.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @journey
      flash[:notice] = 'Změna služební cesty proběhla neúspěšně!'
      redirect_to :action => :index
      return
    end

    respond_to do |format|
      if @journey.update_attributes(params[:journey])
        flash[:notice] = 'Služební cesta byla úspěšně aktualizována.'
        format.html { redirect_to(@journey) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @journey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /journeys/1
  # DELETE /journeys/1.xml
  def destroy
    @journey = Journey.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @journey
      flash[:notice] = 'Žádná služební cesta nebyla smazána!'
      redirect_to :action => :index
      return
    end
    @journey.destroy

    respond_to do |format|
      format.html { redirect_to(journeys_url) }
      format.xml  { head :ok }
    end
  end
end
