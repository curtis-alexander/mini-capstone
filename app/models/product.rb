class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :inventory, numericality: { only_integer: true }
  validates :description, length: { in: 10..500 }

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
end
