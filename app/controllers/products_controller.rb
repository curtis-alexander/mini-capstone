class ProductsController < ApplicationController
  def show_one_product
    render json: { message: "hello" }
  end

  def show_all_product
    render json: { message: "goodbye" }
  end
end
