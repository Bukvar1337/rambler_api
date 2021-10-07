require 'rails_helper'

RSpec.describe Rubric, type: :model do
  it "should translite" do
    rubric = Rubric.create(title: "два")
    expect(rubric.slug).to eq("dwa")
  end
end
