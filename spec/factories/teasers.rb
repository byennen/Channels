# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :teaser do
    video_id 1
    zencoder_output_id "MyString"
    processed false
  end
end
