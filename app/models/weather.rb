class Weather < ApplicationRecord
  serialize :measurements, Array
  has_many :locations, dependent: :destroy
  accepts_nested_attributes_for :locations
  default_scope -> { order(id: :asc) }
end
