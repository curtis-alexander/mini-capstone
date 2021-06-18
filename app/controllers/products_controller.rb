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
      name: "bath bomb",
      price: 10,
      image_url: "https://www.lushusa.com/dw/image/v2/BDMQ_PRD/on/demandware.static/-/Sites-lushcosmetics-export/default/dwaa7b5b89/images/product/04031_a.jpg?sw=800&sh=800",
      description: "circular device to make foamy bath water",
    )
    product.save
    render json: product.as_json
  end
end
