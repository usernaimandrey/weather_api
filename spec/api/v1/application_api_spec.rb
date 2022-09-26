# frozen_string_literal: true

require 'rails_helper'

describe V1::ApplicationAPI do
  context 'GET /v1/helth' do
    it 'return status 200 OK' do
      expected = { status: '200 OK' }
      get '/v1/helth'

      expect(response.status).to eq(200)
      expect(response.body).to eq expected.to_json
    end
  end
end
