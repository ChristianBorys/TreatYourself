class SessionsController < ApplicationController
  def new
  end

  def create
  	owner = Owner.find_by_name(params[:name])
  	if owner && owner.authenticate(params[:password])
  		session[:owner_id] = owner.id
  		redirect_to root_path, :notice => "Welcome #{name}"
  	else
  		flash.now[:alert] = "Invalid name or password"
  		render "new"
  	end
  end

  def destroy
  	session[:owner_id] = nil
  	redirect_to root_path, :notice => "Logged Out!"
  end
end
