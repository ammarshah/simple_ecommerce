class Order < ApplicationRecord
  belongs_to :user
  has_many :order_lines

  before_save :update_total
  
  after_initialize do
    self.order_no ||= generate_random_order_no
  end
  
  def total
    order_lines.collect { |ol| ol.valid? ? (ol.qty.to_i * ol.unit_price.to_f) : 0 }.sum
  end
  
  private

    def update_total
      self[:total] = total
    end

    # this method accepts `size` as an option, default size is 6.
    def generate_random_order_no(options = {})
      size = options.fetch(:size, 6)
      order_no = SecureRandom.hex[0, size].upcase
      "#{order_no}"
    end
end
