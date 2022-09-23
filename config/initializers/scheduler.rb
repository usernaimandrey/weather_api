# frozen_string_literal: true

require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.every '1m' do
  FetchWeatherDataJob.perform_later("#{URL_API}/#{CITY_ID}/#{API_REFERENCE}?apikey=#{API_KEY}&language=#{I18n.default_locale}&details=true")
end
