class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    id = params[:id]
    product = Product.find_by(id: id)
    render json: product
  end

  def create
    product = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      image_url: params[:input_image_url],
      description: params[:input_description],
    )
    product.save
    render json: product.as_json
  end

  def update
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.name = params[:input_name]
    product.price = params[:input_price]
    product.image_url = params[:input_image_url]
    product.description = params[:input_description]
    product.save
    render json: product.as_json
  end

  def destroy
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.destroy
    render json: { message: "product has been deleted" }
  end
end
