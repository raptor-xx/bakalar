class LongtimeResourcesController < ApplicationController
  # GET /longtime_resources
  # GET /longtime_resources.xml
  def index
    @longtime_resources = LongtimeResource.find_all_by_user_id(session[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @longtime_resources }
    end
  end

  # GET /longtime_resources/1
  # GET /longtime_resources/1.xml
  def show
    @longtime_resource = LongtimeResource.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @longtime_resource
      flash[:notice] = 'Tento majetek neexistuje!'
      redirect_to :action => :index
      return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @longtime_resource }
    end
  end

  # GET /longtime_resources/new
  # GET /longtime_resources/new.xml
  def new
    @longtime_resource = LongtimeResource.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @longtime_resource }
    end
  end

  # GET /longtime_resources/1/edit
  def edit
    @longtime_resource = LongtimeResource.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @longtime_resource
      flash[:notice] = 'Tento majetek neexistuje!'
      redirect_to :action => :index
      return
    end
  end

  # POST /longtime_resources
  # POST /longtime_resources.xml
  def create
    @longtime_resource = LongtimeResource.new(params[:longtime_resource])
    @longtime_resource.user_id = session[:user_id]

    respond_to do |format|
      if @longtime_resource.save
        flash[:notice] = 'Majetek byl úspěšně vytvořen.'
        format.html { redirect_to(@longtime_resource) }
        format.xml  { render :xml => @longtime_resource, :status => :created, :location => @longtime_resource }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @longtime_resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /longtime_resources/1
  # PUT /longtime_resources/1.xml
  def update
    @longtime_resource = LongtimeResource.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @longtime_resource
      flash[:notice] = 'Změna majetku proběhla neúspěšně!'
      redirect_to :action => :index
      return
    end

    respond_to do |format|
      if @longtime_resource.update_attributes(params[:longtime_resource])
        flash[:notice] = 'Majetek byl úspěšně aktualizován.'
        format.html { redirect_to(@longtime_resource) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @longtime_resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /longtime_resources/1
  # DELETE /longtime_resources/1.xml
  def destroy
    @longtime_resource = LongtimeResource.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @longtime_resource
      flash[:notice] = 'Žádný majetek nebyl smazán!'
      redirect_to :action => :index
      return
    end
    @longtime_resource.destroy

    respond_to do |format|
      format.html { redirect_to(longtime_resources_url) }
      format.xml  { head :ok }
    end
  end
end
