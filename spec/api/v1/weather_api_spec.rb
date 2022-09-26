# frozen_string_literal: true

require 'rails_helper'

describe V1::WeatherAPI do
  context 'GET /v1/weather' do
    before(:each) do
      @expected = []
      24.times do |i|
        weather = FactoryBot.build(:weather, date_time: Time.zone.now - i.hour)
        weather.save
        @expected << { id: weather.id,
                       date_time: weather.date_time,
                       current_temperature: weather.current_temperature }
      end
    end

    it 'empty body when there is no data' do
      Weather.delete_all
      get '/v1/weather/current'

      expect(response.status).to eq(200)
      expect(response.body).to eq 'null'
    end

    it 'return current tenperature' do
      get '/v1/weather/current'

      expect(response.status).to eq(200)
      expect(response.body).to eq @expected.first.to_json
    end

    it 'return hourly temperature for the last 24' do
      get '/v1/weather/historical'

      expect(response.status).to eq(200)
      expect(response.body).to eq @expected.to_json
    end

    it 'return empty array temperatures' do
      Weather.delete_all
      get '/v1/weather/historical'

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq []
    end

    it 'return maximal temperature' do
      expected = { maximal_temperature: Weather.maximum(:current_temperature) }
      get '/v1/weather/historical/max'

      expect(response.status).to eq(200)
      expect(response.body).to eq expected.to_json
    end

    it 'return minimal temperature' do
      expected = { minimal_temperature: Weather.minimum(:current_temperature) }
      get '/v1/weather/historical/min'

      expect(response.status).to eq(200)
      expect(response.body).to eq expected.to_json
    end

    it 'return average temperature' do
      expected = { avg_temperature: Weather.average(:current_temperature).ceil(1) }
      get '/v1/weather/historical/avg'

      expect(response.status).to eq(200)
      expect(response.body).to eq expected.to_json
    end

    it 'return temperture by time' do
      timesamp = 2.hours.ago.to_i
      expected = Weather.created_between(Time.zone.at(timesamp), Time.zone.at(timesamp) - 1.hour).limit(1)

      get "/v1/weather/by_time/#{timesamp}"

      expect(response.status).to eq(200)
      expect(response.body).to eq expected&.first&.to_json
    end

    it 'return 404 not found' do
      timesamp = 26.hours.ago.to_i
      expected = { error: '404 not found' }

      get "/v1/weather/by_time/#{timesamp}"

      expect(response.status).to eq(404)
      expect(response.body).to eq expected.to_json
    end
  end
end
