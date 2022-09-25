# frozen_string_literal: true

class FetchWeatherDataJob < ApplicationJob
  queue_as :default

  retry_on StandardError, wait: 5.seconds, attempts: 3

  def perform(url)
    WeatherService.call(url)
  end
end
