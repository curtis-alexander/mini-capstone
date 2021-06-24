class SuppliersController < ApplicationController
  def create
    supplier = Supplier.new(
      name: params[:name]
      email: params[:email]
      phone_number: [:phone_number]
      
      supplier.save
      render json: supplier
    )
  end
end
