class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :image_url, :description, :tax, :total, :is_discounted?, :inventory, :supplier
end
