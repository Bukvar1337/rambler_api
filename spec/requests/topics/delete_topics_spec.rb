require 'rails_helper'

describe "delete topic route" do
  before(:each) do
    @topic_one = FactoryBot.create(:random_topic)
    @topic_two = FactoryBot.create(:random_topic)
  end
  it 'should delete the topic' do
    get "/api/topics"
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body).size).to eq(2)
    delete "/api/topics/#{@topic_one.urn}"
    expect(response.status).to eq(204)
    get "/api/topics"
    expect(JSON.parse(response.body).size).to eq(1)
  end
end
