class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private 

  def current_owner 
  	@current_owner ||= Owner.find(session[:owner_id]) if session[:owner_id]
  	rescue ActiveRecord::RecordNotFound
  end

  helper_method :current_owner

  def current_customer
  	@current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end
  helper_method :current_owner, :current_customer
end
