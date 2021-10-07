require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "should translite" do
    tag = Tag.create(title: "два")
    expect(tag.slug).to eq("dwa")
  end
end
