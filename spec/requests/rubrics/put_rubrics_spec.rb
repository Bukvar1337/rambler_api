require 'rails_helper'

describe "PUT /api/rubrics/:id" do
  before(:each) do
    @rubric = FactoryBot.create(:random_rubric)
  end
  it 'updates a rubric' do
    @new_title = "тестовая рубрика"
    @new_slug = "testowaq rubrika"

    put "/api/rubrics/#{@rubric.id}", params: { rubric: {title: @new_title} }
    expect(response.status).to eq(202)
    expect(Rubric.find(@rubric.id).title).to eq(@new_title)
    expect(Rubric.find(@rubric.id).slug).to eq(@new_slug)
  end
end
