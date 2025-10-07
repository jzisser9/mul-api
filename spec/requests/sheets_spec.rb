require 'rails_helper'

RSpec.describe Sheets::API do
  include Rack::Test::Methods

  def app
    Sheets::API
  end

  context 'POST unit_sheet' do
    let(:units) { create_list(:unit, 3, :mech) }
    let(:unit_ids) { units.map(&:id) }
    let(:request_body) { { unit_ids: unit_ids.to_json }.to_json }
    let(:headers) { { 'CONTENT_TYPE' => 'application/json' } }

    it 'returns the passed-in units in HTML format' do
      post 'unit_sheet', request_body, headers

      expect(last_response.status).to eq(201)
      expect(last_response.body).to be_present
      expect(last_response.content_type).to include('text/html')

      # Verify the response contains unit information
      units.each do |unit|
        expected_display_name = "#{unit.name.upcase} #{unit.variant.upcase}"
        expect(last_response.body).to include(expected_display_name)
      end
    end
  end
end
