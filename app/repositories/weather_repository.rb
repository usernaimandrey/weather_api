# frozen_string_literal: true

module WeatherRepository
  extend ActiveSupport::Concern

  included do
    scope :historical, -> { select(:id, :date_time, :current_temperature).limit(24) }

    scope :old_records, -> { where(created_at: (24.hours.ago)..(1.hour.ago)) }

    scope :created_between, ->(begin_date, end_date) { Weather.where('date_time <= ? AND date_time >= ?', begin_date, end_date) }
  end
end
