require 'rails_helper'

describe "post a topic route", :type => :request do
  before do
    @tag_one = FactoryBot.create(:random_tag)
    @tag_two = FactoryBot.create(:random_tag)
    @rubric = FactoryBot.create(:random_rubric)
    post '/api/topics', params: {
      topic: {
        heading: "test heading",
        announcement: "test announcement",
        cover: "/test.jpg",
        body: "test body",
        urn: "/test_urn",
        rubric_id: @rubric.id,
        tag_topics_attributes: [
          {
            tag_id: @tag_one.id
          }
        ],
        tags_attributes: [
          {
            title: "тестовый тэг"
          }
        ]
      }
    }
  end

  it 'returns the topic' do
    expect(JSON.parse(response.body)['heading']).to eq('test heading')
  end
  it 'returns the rubric' do
    expect(JSON.parse(response.body)['rubric']['title']).to eq("#{@rubric.title}")
  end
  it 'returns the tag array size' do
    expect(JSON.parse(response.body)['tags'].size).to eq(2)
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
