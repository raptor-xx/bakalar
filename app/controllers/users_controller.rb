class UsersController < ApplicationController
  protect_from_forgery :only => [:create, :update, :destroy] 
  # GET /users
  # GET /users.xml
  def index
    if session[:root]
      @users = User.find(:all, :order => :name)
    else
      @users = [User.find(session[:user_id])]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    if session[:root]
      @user = User.find(params[:id])
    else
      @user = User.find(session[:user_id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    unless session[:root] 
      return
    end
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    if session[:root]
      @user = User.find(params[:id])
    else
      @user = User.find(session[:user_id])
    end
  end

  # POST /users
  # POST /users.xml
  def create
    unless session[:root] 
      return
    end
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    if session[:user_id] == User.find(params[:id]).id || session[:root]
      @user = User.find(params[:id])
      respond_to do |format|
        if @user.update_attributes(params[:user])
          flash[:notice] = 'User was successfully updated.'
          format.html { redirect_to(@user) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    unless session[:root] 
      return
    end
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
