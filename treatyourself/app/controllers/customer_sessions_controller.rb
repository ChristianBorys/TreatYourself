class CustomerSessionsController < ApplicationController
  def new
  end

  def create
  	customer = Customer.find_by_email(params[:email])
  	if customer && customer.authenticate(params[:password])
  		session[:customer_id] = customer.id
  		redirect_to customer, :notice => "Customer logged in"
  	else
  		flash.now[:alert] = "Invalid email or password"
  	end
  end

  def destroy 
  	session[:customer_id] = nil
  	redirect_to root_path, :notice => "Customer logged out"
  end
  
end
