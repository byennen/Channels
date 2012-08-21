FactoryGirl.define do
  factory :album do
    title "My Song"
    description "la la la la"
    association :channel, factory: :channel, strategy: :build
  end
end
