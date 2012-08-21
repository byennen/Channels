# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :song do
    title "My Song"
    album "First Album"
    price "1.99"
    active true
  end

  factory :album_song, :class => Song do
    association :album, factory: :album, strategy: :build
  end
end
