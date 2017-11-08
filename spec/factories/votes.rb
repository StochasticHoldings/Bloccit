FactoryGirl.define do
  factory :vote do
    value rand(2)
    user
    post
  end
end
