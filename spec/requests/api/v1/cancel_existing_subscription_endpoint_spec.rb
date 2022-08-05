require 'rails_helper'

RSpec.describe "Api::V1::Subscriptions", type: :request do
  describe "PATCH /cancel" do

    def successful_response(id)
      {"data":[{"id":"#{id}","type":"subscription","attributes":{"title":"Gen Mai Cha Monthly","description":"whoops","frequency":"bi_monthly","price":2100,"status":"active","created_at":"#{@subscription_1.created_at}","updated_at":"#{@subscription_1.updated_at}"}}]}
      binding.pry
    end

    before :each do
      @customer_1 = Customer.create!(first_name: "Cedric", last_name: "Diggory", email: "digs-a-lot@yahoo.net", address: "130 Green Acres Dr, Burlington, VT, 05401" )
      @tea_1 = Tea.create!(title: "Gen Mai Cha", description: "nutty and roasty", temperature: 86, brew_time: 210)
      @subscription_1 = Subscription.create!(title: "Gen Mai Cha Monthly", description: "whoops", frequency: 3, price: 2100, status: 1, customer_id: @customer_1.id, tea_id: @tea_1.id)
    end

   
    it "has roughly the correct response shape" do
      get "http://localhost:300/api/v1/subscriptions/", params: {customer_id: @customer_1.id}
      actual = JSON.parse(response.body, symbolize_names: true)
      expect(actual.keys).to eq [:data]
      expect(actual[:data].count).to eq 1
      expect(actual[:data].first.keys.count).to eq 3
      expect(actual[:data].first[:id]).to match /\A\d+\Z/
      expect(actual[:data].first[:attributes][:status]).to eq "active"
      patch "http://localhost:300/api/v1/subscriptions/", params: {subscription_id: @subscription_1.id}
      actual = JSON.parse(response.body, symbolize_names: true)
      expect(actual[:data][:attributes][:status]).to eq "cancelled"
    end
    
  end
end