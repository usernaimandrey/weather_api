#  frozen_string_literal: true

module V1
  class WeatherAPI < ApplicationAPI
    helpers do
      def temperature_by_time
        temperature = Weather.created_between(Time.zone.at(params[:time]), Time.zone.at(params[:time]) - 1.hour).limit(1)
        return error!('404 not found', 404) if temperature.empty?

        temperature.first
      end
    end
    resource :weather do
      desc 'Closest temperature to transmitted time'
      params do
        requires :time, type: Integer
      end
      get '/by_time/:time' do
        temperature_by_time
      end

      namespace :current do
        desc 'Current temperature'
        get do
          Weather.select(:id, :date_time, :current_temperature).first
        end
      end

      namespace :historical do
        desc 'Hourly temperature for the last 24'
        get do
          Weather.historical
        end

        desc 'Maximum temperature in 24 hours'
        get :max do
          { maximal_temperature: Weather.maximum(:current_temperature) }
        end

        desc 'Minimum temperature in 24 hours'
        get :min do
          { minimal_temperature: Weather.minimum(:current_temperature) }
        end

        desc 'Average temperature for 24 hours'
        get :avg do
          { avg_temperature: Weather.average(:current_temperature).ceil(1) }
        end
      end
    end
  end
end
