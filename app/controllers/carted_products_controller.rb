class CartedProductsController < ApplicationController
  def create
    carted_product = CartedProduct.new(
      product_id: params[:product_id],
      user_id: params[:user_id],
      quantity: params[:quantity],
      status: params[:status],
    )
    if carted_product.save
      render json: carted_product.as_json
    else
      render json: { error: carted_product.errors.full_messages }
    end
  end
end
