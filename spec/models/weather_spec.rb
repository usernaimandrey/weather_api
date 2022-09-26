# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Weather, type: :model do
  before(:each) do
    @weather = FactoryBot.build(:weather, date_time: Time.zone.now)
  end

  it 'should be valid' do
    expect(@weather.valid?).to be_truthy
  end
end
