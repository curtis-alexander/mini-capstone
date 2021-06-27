class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :tax, :total, :is_discounted?, :inventory, :supplier, :images
end
