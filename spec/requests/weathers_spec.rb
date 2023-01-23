require 'rails_helper'

RSpec.describe "Weathers", type: :request do
  describe 'POST /weathers' do
    it 'creates a Weather object with nested attr for Locations' do
      post '/weathers', params: {
        description: 'Weather description',
        measurements: ['23.22', '23.22', '23.22', '23.22', '23.22', '23.22', '23.22', '23.22'],
        locations_attributes: [{
          lat: 23.34,
          lng: 34.34,
          description: 'ok'
        },{
          lat: 23.34,
          lng: 34.34,
          description: 'ok'
        },{
          lat: 23.34,
          lng: 34.34,
          description: 'ok'
        }]
      }

      expect(response).to have_http_status(:created)
      expect(Weather.find(parsed_response[:data][:id]).locations.count).to eq 3
    end
  end
end
