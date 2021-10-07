require 'rails_helper'

describe "PUT /api/topics/:id" do
  before(:each) do
    @topic = FactoryBot.create(:random_topic)
  end
  it 'updates a topic' do
    @new_heading = "test_heading"

    put "/api/topics#{@topic.urn}", params: { topic: {heading: @new_heading} }
    expect(response.status).to eq(202)
    expect(Topic.find(@topic.id).heading).to eq(@new_heading)
  end
end
