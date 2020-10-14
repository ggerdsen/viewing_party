require 'rails_helper'

RSpec.describe Review do
  it "exists" do
    attr = {:results=>
              [{
              :author=>"elshaarawy",
              :content=>"very good movie 9.5/10 محمد الشعراوى",
              :id=>"5723a329c3a3682e720005db",
              :url=>"https://www.themoviedb.org/review/5723a329c3a3682e720005db"
              }]
            }

    review = Review.new(attr)
    expect(review).to be_a(Review)
    expect(review.info.first[:author]).to eq("elshaarawy")
    expect(review.info.first[:id]).to eq("5723a329c3a3682e720005db")
    expect(review.info.first[:url]).to eq("https://www.themoviedb.org/review/5723a329c3a3682e720005db")
    expect(review.info.first[:content]).to eq("very good movie 9.5/10 محمد الشعراوى")
  end
end
