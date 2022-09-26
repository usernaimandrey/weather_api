# frozen_string_literal: true

FactoryBot.define do
  factory :weather do
    current_temperature { Faker::Number.within(range: 0.0..20.0).ceil(2) }
  end
end
