require 'rails_helper'

RSpec.describe Sheets::API do
  include Rack::Test::Methods

  def app
    Sheets::API
  end

  context 'POST unit_sheet' do
    it 'returns the passed-in units in JSON' do
      unit_ids = [1, 2, 3]
      post 'unit_sheet', { unit_ids: unit_ids }.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(last_response.body).to eq(201)
    end
  end
end
