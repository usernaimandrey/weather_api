# frozen_string_literal: true

class FetchWeatherDataJob < ApplicationJob
  queue_as :default

  def perform
    WeatherService.call
  end
end
