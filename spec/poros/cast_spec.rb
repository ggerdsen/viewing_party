require 'rails_helper'

RSpec.describe Cast do
  it "exists" do
    attr = {:cast=>
              [{
                :cast_id=>14,
                :character=>"Oskar Schindler",
                :credit_id=>"52fe4242c3a36847f8010299",
                :gender=>2,
                :id=>3896,
                :name=>"Liam Neeson",
                :order=>0,
                :profile_path=>"/wloLd5YrrlRPiTgfaMJsAx7U6hr.jpg"
              }]
            }

    cast = Cast.new(attr)
    expect(cast).to be_a(Cast)
    expect(cast.info.first[:character]).to eq("Oskar Schindler")
    expect(cast.info.first[:credit_id]).to eq("52fe4242c3a36847f8010299")
    expect(cast.info.first[:name]).to eq("Liam Neeson")
  end
end
