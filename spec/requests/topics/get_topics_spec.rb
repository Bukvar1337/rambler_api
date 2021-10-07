require 'rails_helper'

describe "get all topic route", :type => :request do
  let!(:topics) { FactoryBot.create_list(:random_topic, 5) }

  before { get '/api/topics' }

  it 'returns all topics' do
    expect(JSON.parse(response.body).size).to eq(5)
  end
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
