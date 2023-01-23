class WeathersController < ApplicationController
  def create
    weather = Weather.new(weather_params)
     if weather.save!
      render json: { data: weather }, status: :created
     else
      render json: { error: weather.errors.full_messages }, status: :unprocessable_entity
     end
  end

  def weather_params
    params.permit(
      :description,
      measurements: [],
      locations_attributes: [
        :description,
        :lat,
        :lng
      ]
    )
  end
end
