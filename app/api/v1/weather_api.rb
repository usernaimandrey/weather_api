#  frozen_string_literal: true

module V1
  class WeatherAPI < ApplicationAPI
    resource :weather do
      desc 'Closest temperature to transmitted time'
      params do
        requires :time, type: Integer
      end
      get '/by_time/:time' do
        { time: params[:time] }
      end

      namespace :current do
        desc 'Current temperature'
        get do
          { data: Weather.first.data, current_temperature: Weather.first.current_temperature }
        end
      end

      namespace :historical do
        desc 'Hourly temperature for the last 24'
        get do
          Weather.historical
        end

        desc 'Maximum temperature in 24 hours'
        get :max do
          { maximal_temperature: Weather
            .max_temperature
            .first
            .maximal_temperature }
        end

        desc 'Minimum temperature in 24 hours'
        get :min do
          { maximal_temperature: Weather
            .min_temperature
            .first
            .minimal_temperature }
        end

        desc 'Average temperature for 24 hours'
        get :avg do
          { avg_temperature: Weather.first.avg_temperature }
        end
      end
    end
  end
end
