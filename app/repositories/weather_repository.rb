# frozen_string_literal: true

module WeatherRepository
  extend ActiveSupport::Concern

  included do
    scope :historical, lambda {
                         select(:minimal_temperature,
                                :maximal_temperature,
                                :avg_temperature,
                                :current_temperature,
                                :data,
                                :id)
                       }

    scope :max_temperature, -> { order('maximal_temperature DESC').limit(1) }

    scope :min_temperature, -> { order('minimal_temperature ASC').limit(1) }
  end
end
