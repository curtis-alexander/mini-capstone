class CartedProductsController < ApplicationController
  def create
    carted_product = CartedProduct.new(
      product_id: params[:product_id],
      user_id: current_user.id,
      quantity: params[:quantity],
      status: "carted",
      order_id: nil,
    )
    if carted_product.save
      render json: carted_product.as_json
    else
      render json: { error: carted_product.errors.full_messages }
    end
  end

  def index
    carted_products = CartedProduct.all
    render json: carted_products.as_json
  end
end
