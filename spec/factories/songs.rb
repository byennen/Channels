# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :song do
    title "My Song"
    album "First Album"
    song_price "1.99"
    album_price "9.99"
    active true
  end

  factory :song4real, :class => Song do
    filename "dvno.mp3"
    channel_id 1
  end
end
