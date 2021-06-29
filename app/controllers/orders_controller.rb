class OrdersController < ApplicationController
  def create
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: params[:tax],
      total: params[:total],
    )
    order.save
    render json: order.as_json
  end

  def show
    order = Order.find_by(id: params[:id])
    render json: order.as_json
  end

  def index
    orders = Order.all
    render json: orders.as_json
  end

  def subtotal
    product = Product.find_by(id: params[:product_id])
    params[:quantity].to_i * product.price
  end

  def tax
  end

  def total
  end
end
