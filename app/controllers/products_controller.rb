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

  # def show_one_product
  #   product = Product.first
  #   render json: product.as_json
  # end

  # def show_all_product
  #   product = Product.all
  #   render json: product.as_json
  # end
end
