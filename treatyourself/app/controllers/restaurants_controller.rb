class RestaurantsController < ApplicationController

	
	def index
		@restaurants = Restaurant.all

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = current_owner.restaurants.build(restaurant_params)
		if  @restaurant.save
			redirect_to restaurant_path(@restaurant)
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(restaurant_params)

		if @restaurant.update_attributes(restaurant_params)
			redirect_to @restauran
		else
			render 'edit'
		end	
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_path, notice: "restaurant deleted"
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:name, :email, :image, :phone_number, :website_url, :owner_id)
	end

	end
