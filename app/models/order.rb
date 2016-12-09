class Order < ApplicationRecord
  belongs_to :user
  has_many :order_lines

  before_save :update_total

  def total
    order_lines.collect { |ol| ol.valid? ? (ol.qty.to_i * ol.unit_price.to_f) : 0 }.sum
  end
  
  private

    def update_total
      self[:total] = total
    end
end
