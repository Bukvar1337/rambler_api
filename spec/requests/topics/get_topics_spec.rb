require 'rails_helper'
describe "get methods" do

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
  describe "GET /api/topics/:urn" do
    before(:each) do
      @topic = FactoryBot.create(:random_topic)
    end
    it 'get a topic' do

      get "/api/topics#{@topic.urn}"

      expect(JSON.parse(response.body)['heading']).to eq(@topic.heading)
      expect(response.status).to eq(200)
    end
  end

  describe "GET /api/topics/:unr?params" do
    before(:each) do
      @topic_one = FactoryBot.create(:random_topic)
      @topic_two = FactoryBot.create(:random_topic)
      @tag = @topic_two.tags.create(title: "да")
      @topic_three = FactoryBot.create(:random_topic)
    end
    it 'get topics by ids' do
      get "/api/topics", params: { id: ["#{@topic_one.id}", "#{@topic_two.id}"] }
      expect(JSON.parse(response.body).size).to eq(2)
    end
    it 'get topics by rubric_id' do
      get "/api/topics", params: { rubric_id: @topic_one.rubric.id }
      expect(JSON.parse(response.body).size).to eq(1)
      expect(JSON.parse(response.body)[0]['heading']).to eq(@topic_one.heading)
    end
    it 'get topics by tag_id' do
      get "/api/topics", params: { tag_id: @tag.id }
      expect(JSON.parse(response.body).size).to eq(1)
      expect(JSON.parse(response.body)[0]['tags'][0]['title']).to eq(@tag.title)
    end
    it 'get topics by order' do
      get "/api/topics", params: { sort_column: "id", sort_method: "DESC" }
      expect(JSON.parse(response.body)[0]['heading']).to eq(@topic_three.heading)
      get "/api/topics", params: { sort_column: "created_at", sort_method: "ASC" }
      expect(JSON.parse(response.body)[0]['heading']).to eq(@topic_one.heading)
    end
  end

end
