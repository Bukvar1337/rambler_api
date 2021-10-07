require 'rails_helper'

describe "delete tag route" do
  before(:each) do
    @tag_one = FactoryBot.create(:random_tag)
    @tag_two = FactoryBot.create(:random_tag)
  end
  it 'should delete the tag' do
    get "/api/tags"
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body).size).to eq(2)
    delete "/api/tags/#{@tag_one.id}"
    expect(response.status).to eq(204)
    get "/api/tags"
    expect(JSON.parse(response.body).size).to eq(1)
  end
end
