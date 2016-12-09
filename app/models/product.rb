class Product < ApplicationRecord
  has_many :order_lines

  validates_presence_of :name, :description, :status
  validates :price, presence: true, numericality: { greater_than: 0 }

  scope :enabled, -> { where(status: 1) }

  def status
  	1 ? "Enabled" : "Disabled"
  end
end
