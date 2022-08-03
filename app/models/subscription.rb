class Subscription < ApplicationRecord
    belongs_to :customer
    belongs_to :tea

    validates_presence_of :title, :description, :frequency, :price, :status
end
