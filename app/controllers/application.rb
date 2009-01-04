# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  session :session_key => '_bakalar_session_id'
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery  :secret => 'a22248a7d884c25e8baef795ff14c260'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  before_filter :authorize, :except => :login
  
  protected
  
  def authorize
    session[:original_uri] = request.request_uri
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Prosím zalogujte se"
      redirect_to(:controller => "admin", :action => "login")
    end
  end
end
