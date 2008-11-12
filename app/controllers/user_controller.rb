class UserController < ApplicationController
  before_filter :authorize, :except => :login
  def add
    @user = User.new(params[:user])
    if request.post?
      if session[:root] and @user.save
        flash.now[:notice] = "Vytvořen uživatel #{@user.name}"
        @user = User.new
      else
        flash.now[:notice] = "Uživatel nebyl vytvořen."
      end
    end
  end
  
  def delete
    if request.post? and session[:root]
      user = User.find(params[:id])
      user.destroy
      flash[:notice] = "Uživatel #{user.name} smazán."
    end
    redirect_to(:action => :list)
  end
  
  def login
    session[:user_id] = nil
    session[:root] = nil
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        uri = session[:original_uri]
        logout_uri = url_for(:action => "logout", :only_path => "true")
        login_uri = url_for(:action => "login", :only_path => "true")
        if (logout_uri == uri) or (login_uri == uri)
          uri = nil
        end
        session[:original_uri] = nil
        if user.name == "root"
          session[:root] = true
        end
        redirect_to(uri || { :action => "index" })
      else
        flash.now[:notice] = "Špatně zadaná kombinace jména a hesla."
      end
    end
  end

  def logout
    session[:user_id] = nil
    session[:root] = nil
    flash[:notice] = "Uživatel byl odhlášen."
    redirect_to(:action => "login")
  end

  def list
    @all_users = User.find(:all)
  end
  
  def index
    @user = User.find(session[:user_id])
  end  
  
  def edit
    @name = User.find(session[:user_id]).name
    if request.post?    
      if session[:root]
        @user = User.find_by_name(params[:user][:name])
        if @user
          @user.password=(params[:user][:password])
          if @user.save
            flash.now[:notice] = "Změna uživatele #{@user.name} proběhla úspěšně."
          else
            flash.now[:notice] = "Změna uživatele neproběhla úspěšně."
          end
        else
            flash.now[:notice] = "Takový uživatel neexistuje."    
        end
        @user = User.new
      else
        @user = User.find(session[:user_id])
        params[:user][:name] = @user.name
        if @user.update_attributes(params[:user])
          flash[:notice] = "Změna uživatele proběhla úspěšně. "
          redirect_to({ :action => "index" })
        else
          flash.now[:notice] = "Změna neproběhla úspěšně. "
        end
      end
    end
  end
end
