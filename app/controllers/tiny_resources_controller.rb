class TinyResourcesController < ApplicationController
  # GET /tiny_resources
  # GET /tiny_resources.xml
  def index
    @tiny_resources = TinyResource.find_all_by_user_id(session[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tiny_resources }
    end
  end

  # GET /tiny_resources/1
  # GET /tiny_resources/1.xml
  def show
    @tiny_resource = TinyResource.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @tiny_resource
      flash[:notice] = 'Tento majetek neexistuje!'
      redirect_to :action => :index
      return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tiny_resource }
    end
  end

  # GET /tiny_resources/new
  # GET /tiny_resources/new.xml
  def new
    @tiny_resource = TinyResource.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tiny_resource }
    end
  end

  # GET /tiny_resources/1/edit
  def edit
    @tiny_resource = TinyResource.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @tiny_resource
      flash[:notice] = 'Tento majetek neexistuje!'
      redirect_to :action => :index
      return
    end
  end

  # POST /tiny_resources
  # POST /tiny_resources.xml
  def create
    @tiny_resource = TinyResource.new(params[:tiny_resource])
    @tiny_resource.user_id = session[:user_id]

    respond_to do |format|
      if @tiny_resource.save
        flash[:notice] = 'Majetek byl úspěšně vytvořen.'
        format.html { redirect_to(@tiny_resource) }
        format.xml  { render :xml => @tiny_resource, :status => :created, :location => @tiny_resource }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tiny_resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tiny_resources/1
  # PUT /tiny_resources/1.xml
  def update
    @tiny_resource = TinyResource.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @tiny_resource
      flash[:notice] = 'Tento majetek neexistuje!'
      redirect_to :action => :index
      return
    end

    respond_to do |format|
      if @tiny_resource.update_attributes(params[:tiny_resource])
        flash[:notice] = 'Majetek byl úspěšně aktualizován.'
        format.html { redirect_to(@tiny_resource) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tiny_resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tiny_resources/1
  # DELETE /tiny_resources/1.xml
  def destroy
    @tiny_resource = TinyResource.find(:first, :conditions => {:id => params[:id], :user_id => session[:user_id]})
    unless @tiny_resource
      flash[:notice] = 'Žádný majetek nebyl smazán!'
      redirect_to :action => :index
      return
    end
    @tiny_resource.destroy

    respond_to do |format|
      format.html { redirect_to(tiny_resources_url) }
      format.xml  { head :ok }
    end
  end
end
