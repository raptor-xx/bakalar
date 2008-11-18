class AdminController < ApplicationController
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
        flash.now[:notice] = "Invalid login."
      end
    end
  end

  def logout
    session[:user_id] = nil
    session[:root] = nil
    flash[:notice] = "User was logged out."
    redirect_to(:action => "login")
  end

  def index
  end

end
