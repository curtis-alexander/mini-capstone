class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :inventory, numericality: { only_integer: true }
  validates :description, length: { in: 10..500 }

  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :users, through: :carted_products

  def is_discounted?
    if price && price < 10
      return true
    else
      return false
    end
  end

  def tax
    if price
      return price * 0.09
    end
  end

  def total
    if price
      return price + tax
    end
  end

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
end
