class Subscription < ApplicationRecord
    enum status: [ :cancelled, :active ]
    enum frequency: [ :weekly, :semi_weekly, :monthly, :bi_monthly, :semi_monthly, :semi_anually]


    belongs_to :customer
    belongs_to :tea

    validates_presence_of :title, :description, :frequency, :price, :status
end
