require 'rails_helper'

describe "get all tag route", :type => :request do
  let!(:tags) { FactoryBot.create_list(:random_tag, 5) }

  before { get '/api/tags' }

  it 'returns all tags' do
    expect(JSON.parse(response.body).size).to eq(5)
  end
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
