class Product < ApplicationRecord
  validates_presence_of :name, :description, :price, :status
  validates_numericality_of :price, greater_than: 0

  scope :enabled, -> { where(status: 1) }

  def status
  	1 ? "Enabled" : "Disabled"
  end
end
