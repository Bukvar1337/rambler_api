require 'rails_helper'

describe "PUT /api/tags/:id" do
  before(:each) do
    @tag = FactoryBot.create(:random_tag)
  end
  it 'updates a tag' do
    @new_title = "тестовый тэг"
    @new_slug = "testowyj täg"

    put "/api/tags/#{@tag.id}", params: { tag: {title: @new_title} }
    expect(response.status).to eq(202)
    expect(Tag.find(@tag.id).title).to eq(@new_title)
    expect(Tag.find(@tag.id).slug).to eq(@new_slug)
  end
end
