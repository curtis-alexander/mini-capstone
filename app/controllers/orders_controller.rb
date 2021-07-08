class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    orders = Order.where(user_id: current_user.id)
    # orders = current_user.orders
    render json: orders.as_json
  end

  def create
    carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    calculated_subtotal = 0
    calculated_tax = 0
    carted_products.each do |cp|
      calculated_subtotal += cp.product.price * cp.quantity
      calculated_tax += cp.product.tax * cp.quantity
    end

    order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_subtotal + calculated_tax,
    )
    order.save
    carted_products.each do |cp|
      cp.update(status: "purchased", order_id: order.id)
    end
    render json: order.as_json
  end

  def show
    order = Order.find_by(id: params[:id], user_id: current_user.id)
    render json: order.as_json
  end
end
