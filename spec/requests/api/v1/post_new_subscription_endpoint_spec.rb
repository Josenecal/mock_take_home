require 'rails_helper'

RSpec.describe "Api::V1::Subscriptions", type: :request do
  describe "POST /create" do
    before :each do
        @customer_1 = Customer.create!(first_name: "Cedric", last_name: "Diggory", email: "digs-a-lot@yahoo.net", address: "130 Green Acres Dr, Burlington, VT, 05401" )
        @tea_1 = Tea.create!(title: "Gen Mai Cha", description: "nutty and roasty", temperature: 86, brew_time: 210)
    end

    it "accepts a customer_id and a tea_id parameter and creates (and returns) that new subscription object" do
        post "http://localhost:300/api/v1/subscriptions/", params: {tea_id: @tea_1.id, customer_id: @customer_1.id, frequency: "weekly"}
        actual = JSON.parse(response.body, symbolize_names: true)
        expect(actual.keys).to eq [:data]
        expect(actual[:data].keys.count).to eq 3
        expect(actual[:data][:type]).to eq "subscription"
        expect(actual[:data][:id]).to match /\A\d+\Z/
    end
    
  end
end
