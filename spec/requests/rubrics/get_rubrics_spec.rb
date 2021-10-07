require 'rails_helper'

describe "get all rubrics route", :type => :request do
  let!(:rubrics) { FactoryBot.create_list(:random_rubric, 5) }

  before { get '/api/rubrics' }

  it 'returns all rubrics' do
    expect(JSON.parse(response.body).size).to eq(5)
  end
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
