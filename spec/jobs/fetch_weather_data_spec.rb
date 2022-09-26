# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FetchWeatherDataJob, type: :job do
  describe '#perform_later' do
    it 'uploads a backup' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        FetchWeatherDataJob.perform_later('https://example.com')
      end.to have_enqueued_job
    end
  end
end
