require 'rails_helper'
describe "get methods" do
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
  describe "GET /api/rubrics/:id" do
    before(:each) do
      @rubric = FactoryBot.create(:random_rubric)
    end
    it 'get a rubric' do

      get "/api/rubrics/#{@rubric.id}"

      expect(JSON.parse(response.body)['title']).to eq(@rubric.title)
      expect(response.status).to eq(200)
    end
  end
  describe "GET /api/rubrics/:id?search_string=" do
    before(:each) do
      @rubric_one = Rubric.create(title:"да")
      @rubric_two = Rubric.create(title:"нет")
    end
    it 'get a rubric by params' do

      get "/api/rubrics", params: { search_string: "да" }
      expect(JSON.parse(response.body).size).to eq(1)
      expect(JSON.parse(response.body)[0]['title']).to eq(@rubric_one.title)

    end
  end
end