require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'validations and relations' do
    it { should valid_presence_of :first_name }
    it { should valid_presence_of :last_name }
    it { should valid_presence_of :email }
    it { should valid_presence_of :address }
  end
end
