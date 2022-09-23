#  frozen_string_literal: true

require 'grape-swagger'

module V1
  class ApplicationAPI < ApplicationAPI
    content_type :json, 'application/json;charset=UTF-8'

    format :json

    mount WeatherAPI

    desc 'Server State'
    get :helth do
      { status: '200 OK' }
    end
  end
end
