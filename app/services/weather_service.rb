# frozen_string_literal: true

class WeatherService
  class << self
    def call(url)
      request = JSON.parse(HTTP.get(url).body)

      request.each do |hour|
        attr = {
          current_temperature: hour['Temperature']['Metric']['Value'],
          date_time: hour['LocalObservationDateTime']
        }

        Weather.create(attr)
      end
    end
  end
end
