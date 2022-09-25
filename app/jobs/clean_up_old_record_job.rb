# frozen_string_literal: true

class CleanUpOldRecordJob < ApplicationJob
  queue_as :default

  retry_on StandardError, wait: 5.seconds, attempts: 5

  def perform
    Weather.where(data: (24.hours.ago)..(1.hour.ago)).delete_all
  end
end
