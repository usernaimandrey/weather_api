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
          { current: 'current' }
        end
      end

      namespace :historical do
        desc 'Hourly temperature for the last 24'
        get do
          { historical: '24 hours' }
        end

        desc 'Maximum temperature in 24 hours'
        get :max do
          { max: 200 }
        end

        desc 'Minimum temperature in 24 hours'
        get :min do
          { min: 100 }
        end

        desc 'Average temperature for 24 hours'
        get :avg do
          { avg: 50 }
        end
      end
    end
  end
end
