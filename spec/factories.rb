FactoryBot.define do
  service_array = ["Test Service", "Test Service Two"]
  letter = ["a", "b", "c", "d"]
  factory :random_rubric, class: Rubric do
    sequence(:title) { |i| "заголовок #{i}" }
  end
  factory :random_tag, class: Tag do
    sequence(:title) { |i| "заголовок #{i}" }
  end
  factory :random_topic, class: Topic do
    heading { Faker::Emotion.noun }
    announcement { Faker::Emotion.adjective }
    cover { Faker::File.file_name(dir: 'path/to') }
    body { Faker::Emotion.adjective }
    sequence(:urn) { |i| Faker::File.file_name(dir: '/foo/bar', name: "name#{i}")}
    association :rubric, factory: :random_rubric
  end
end
