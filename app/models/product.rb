class Product < ApplicationRecord
  validates_presence_of :name, :description, :price, :status
end
