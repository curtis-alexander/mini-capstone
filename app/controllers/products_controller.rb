class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products
  end

  def show
    id = params[:id]
    product = Product.find_by(id: id)
    render json: product
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
      inventory: params[:inventory],
    )
    if product.save
      render json: product
    else
      render json: { error: product.errors.full_messages }
    end
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.image_url = params[:image_url] || product.image_url
    product.description = params[:description] || product.description

    if product.save
      render json: product
    else
      render json: { error: product.errors.full_messages }
    end
  end

  def destroy
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.destroy
    render json: { message: "product has been deleted" }
  end
end
