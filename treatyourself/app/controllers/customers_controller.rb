class CustomersController < ApplicationController
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(customer_params)
    if @customer.update_attributes(params[:customer])
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end


  def new
  @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])

  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save

      redirect_to root_path, alert: "account created"
    else
      render 'new'
    end
  end

  
end
