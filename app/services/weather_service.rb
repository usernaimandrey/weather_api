# frozen_string_literal: true

class WeatherService
  class << self
    def call
      url = "#{URL_API}/#{CITY_ID}/#{API_REFERENCE}?apikey=#{API_KEY}&language=#{I18n.default_locale}&details=true"
      request = JSON.parse(HTTP.get(url).body)

      request.reverse_each do |hour|
        attr = {
          data: hour['LocalObservationDateTime'],
          minimal_temperature: hour['TemperatureSummary']['Past24HourRange']['Minimum']['Metric']['Value'],
          maximal_temperature: hour['TemperatureSummary']['Past24HourRange']['Maximum']['Metric']['Value'],
          current_temperature: hour['Temperature']['Metric']['Value'],
          avg_temperature: average_temperature(request)
        }

        Weather.create(attr)
      end
    rescue StandardError
      []
    end

    private

    def average_temperature(request)
      result = 0
      request.each do |hour|
        result += hour['Temperature']['Metric']['Value']
      end
      (result / request.size).ceil(2)
    end
  end
end