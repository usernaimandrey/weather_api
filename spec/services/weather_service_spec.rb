# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherService do
  before(:each) do
    @url = "#{URL_API}/#{CITY_ID}/#{API_REFERENCE}?apikey=#{API_KEY}&language=#{I18n.default_locale}"
    @expected = load_fixture('../fixtures/weather.json')
  end

  it '#work weather_service' do
    VCR.use_cassette('weather') do
      response = WeatherService.call(@url)

      expect(response.count).to eq 24
      expect(response[0]).to have_key('LocalObservationDateTime')
      expect(response[0]).to have_key('Temperature')
    end
  end
end
