class ProductsController < ApplicationController
  def show_one_product
    product = Product.first
    render json: product.as_json
  end

  def show_all_product
    product = Product.all
    render json: product.as_json
  end
end
