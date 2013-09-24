class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # add root crumb
  add_crumb "Lister", '/'

  # rescue from 404 errors
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
  
  def record_not_found
    # render text: "404 Not Found Sucka!", status: 404
    render 'error/404', status: 404
  end

end
