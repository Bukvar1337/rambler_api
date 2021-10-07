require 'rails_helper'

describe "delete rubric route" do
  before(:each) do
    @rubric_one = FactoryBot.create(:random_rubric)
    @rubric_two = FactoryBot.create(:random_rubric)
  end
  it 'should delete the rubric' do
    get "/api/rubrics"
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body).size).to eq(2)
    delete "/api/rubrics/#{@rubric_one.id}"
    expect(response.status).to eq(204)
    get "/api/rubrics"
    expect(JSON.parse(response.body).size).to eq(1)
  end
end
