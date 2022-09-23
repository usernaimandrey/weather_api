# frozen_string_literal: true

class FetchWeatherDataJob < ApplicationJob
  queue_as :default

  def perform(url)
    WeatherService.call(url)
  end
end
