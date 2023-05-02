require_relative '../../app'
require 'spec_helper'
require 'rack/test'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context 'GET /names' do
    it 'Should ' do
      response = get("/names", names: "Julia, Mary, Karim")
      expect(response.body).to eq ("Julia, Mary, Karim")
      expect(response.status).to eq (200)
    end

    it 'Should ' do
      response = get("/names", names: "Matt, John, Paul")
      expect(response.body).to eq ("Matt, John, Paul")
      expect(response.status).to eq (200)
    end
  end
end
