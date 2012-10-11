# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :play_count do
    playable_type "MyString"
    playable_id 1
    played_on "2012-10-08"
  end
end
