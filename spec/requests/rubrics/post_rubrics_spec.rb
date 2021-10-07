require 'rails_helper'

describe "post a rubric route", :type => :request do
  before do
    post '/api/rubrics', params: { rubric: {title: "тестовая рубрика"} }
  end

  it 'returns the rubric' do
    expect(JSON.parse(response.body)['title']).to eq('тестовая рубрика')
  end
  it 'returns the rubric' do
    expect(JSON.parse(response.body)['slug']).to eq('testowaq rubrika')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
