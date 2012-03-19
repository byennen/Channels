# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :song do
    title "MyString"
    album "MyString"
    song_price "9.99"
    album_price "9.99"
  end
end
