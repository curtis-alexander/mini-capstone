class Product < ApplicationRecord
  def is_discounted?
    if price < 10
      return "true"
    elsif price >= 10
      return "false"
    end
  end

  def tax
    return price * 0.09
  end

  def total
    price + tax
  end
end
