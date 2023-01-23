class Weather < ApplicationRecord
  serialize :measurements, Array
  has_many :locations, dependent: :destroy
end
