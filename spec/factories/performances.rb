# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :performance do
    video_id 1
    video "MyString"
    zencoder_output_id "MyString"
    processed false
  end
end
