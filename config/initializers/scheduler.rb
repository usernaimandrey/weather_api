# frozen_string_literal: true

# require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

# Run task once at server startup
scheduler.in '5s', overlap: false do
  FetchWeatherDataJob.perform_later("#{URL_API}/#{CITY_ID}/#{API_REFERENCE}?apikey=#{API_KEY}&language=#{I18n.default_locale}")
end

scheduler.every '1h' do
  FetchWeatherDataJob.perform_later("#{URL_API}/#{CITY_ID}/#{API_REFERENCE}?apikey=#{API_KEY}&language=#{I18n.default_locale}")
end

scheduler.every '1h10m' do
  CleanUpOldRecordJob.perform_later
end
