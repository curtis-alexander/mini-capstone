class SuppliersController < ApplicationController
  def create
    supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
    )
    supplier.save
    render json: supplier
  end

  def update
    supplier = Supplier.find_by(id: params[:id])
    supplier.name = params[:name] || supplier.name
    supplier.email = params[:email] || supplier.email
    supplier.phone_number = params[:phone_number] || supplier.phone_number

    supplier.save
    render json: supplier
  end
end
