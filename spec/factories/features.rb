# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feature do
    audio false
    vault false
    news false
    events false
    giving false
  end
end
