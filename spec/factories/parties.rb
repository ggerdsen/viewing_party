FactoryBot.define do
  factory :party do
    movie_title { "MyString" }
    duration { 1 }
    date { "MyString" }
    time { "MyString" }
    user { nil }
  end
end
