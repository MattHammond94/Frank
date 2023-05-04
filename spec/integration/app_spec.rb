require_relative '../../app'
require 'spec_helper'
require 'rack/test'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context 'GET /names' do
    it 'Should return all passed names successfully' do
      response = get("/names", names: "Julia, Mary, Karim")
      expect(response.body).to eq ("Julia, Mary, Karim")
      expect(response.status).to eq (200)
    end

    it 'Should return all passed names successfully' do
      response = get("/names", names: "Matt, John, Paul")
      expect(response.body).to eq ("Matt, John, Paul")
      expect(response.status).to eq (200)
    end
  end

  context 'POST /sort-names' do
    it 'Should return a 404 when typo present' do
      response = post('/sort-namesss')
      expect(response.status).to eq(404)
    end

    it 'Should return a list of names sorted alpahbetically' do
      response = post('/sort-names?names=Zack,Josh,Mark,Cameron,Aaron,Xavier')
      expect(response.status).to eq(200)
      expect(response.body).to eq 'Aaron,Cameron,Josh,Mark,Xavier,Zack'
    end
  end
end
