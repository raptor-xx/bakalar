# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_podnikatel_session_id'
  before_filter :authorize
  
  private
  
  def authorize
    session[:original_uri] = request.request_uri
    if @autorize_called
      return #rails nerady twice redirect
    end
    @autorize_called = true
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Prosím zalogujte se"
      redirect_to(:controller => "user", :action => "login")
    end
  end
end
