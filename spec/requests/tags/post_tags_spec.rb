require 'rails_helper'

describe "post a tag route", :type => :request do
  before do
    post '/api/tags', params: { tag: {title: "тестовый тэг"} }
  end

  it 'returns the tag' do
    expect(JSON.parse(response.body)['title']).to eq('тестовый тэг')
  end
  it 'returns the tag' do
    expect(JSON.parse(response.body)['slug']).to eq('testowyj täg')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
