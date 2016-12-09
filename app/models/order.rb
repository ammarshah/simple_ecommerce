class Order < ApplicationRecord
  belongs_to :user
  has_many :order_lines

  before_save :update_total
  
  after_initialize do
    self.order_no ||= generate_random_order_no
  end
  
  scope :by_user, -> (user) { where(user: user) }
  scope :placed, ->  { where.not(date: nil) } # an order can stay in cart for days, so we'll set the date only on the final checkout event.
                                              # so an order is said to placed when the date is not nil.
                                              # An alternate approach could be by setting order status.

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
