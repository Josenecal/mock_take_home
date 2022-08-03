require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'validations and relations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :frequency }
    it { should validate_presence_of :price }
    it { should validate_presence_of :status }

    it { should belong_to :customer }
    it { should belong_to :tea }
  end
end
