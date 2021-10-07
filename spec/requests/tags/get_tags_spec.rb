require 'rails_helper'
describe "get methods" do

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

  describe "GET /api/tags/:id" do
    before(:each) do
      @tag = FactoryBot.create(:random_tag)
    end
    it 'get a tag' do

      get "/api/tags/#{@tag.id}"

      expect(JSON.parse(response.body)['title']).to eq(@tag.title)
      expect(response.status).to eq(200)
    end
  end

  describe "GET /api/tags/:id?search_string=" do
    before(:each) do
      @tag_one = Tag.create(title:"да")
      @tag_two = Tag.create(title:"нет")
    end
    it 'get a tag by params' do

      get "/api/tags", params: { search_string: "да" }
      expect(JSON.parse(response.body).size).to eq(1)
      expect(JSON.parse(response.body)[0]['title']).to eq(@tag_one.title)

    end
  end
end
