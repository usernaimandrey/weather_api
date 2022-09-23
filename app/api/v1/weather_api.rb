#  frozen_string_literal: true

module V1
  class WeatherAPI < ApplicationAPI
    resource :weather do
      desc 'closest temperature to transmitted time'
      params do
        requires :time, type: Integer
      end
      get '/by_time/:time' do
        { time: params[:time] }
      end

      namespace :current do
        get do
          { current: 'current' }
        end
      end

      namespace :historical do
        get do
          { historical: '24 hours' }
        end

        get :max do
          { max: 200 }
        end

        get :min do
          { min: 100 }
        end

        get :avg do
          { avg: 50 }
        end
      end
    end
  end
end
