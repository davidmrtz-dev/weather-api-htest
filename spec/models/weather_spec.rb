require 'rails_helper'

RSpec.describe Weather, type: :model do
  it { should have_many(:locations) }
end