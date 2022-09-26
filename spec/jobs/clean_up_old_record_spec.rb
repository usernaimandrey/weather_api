# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CleanUpOldRecordJob, type: :job do
  describe '#perform_later' do
    it 'uploads a backup' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        CleanUpOldRecordJob.perform_later
      end.to have_enqueued_job
    end
  end
end
