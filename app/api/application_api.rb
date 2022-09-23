#  frozen_string_literal: true

class ApplicationAPI < Grape::API
  mount V1::ApplicationAPI => 'v1'
end
