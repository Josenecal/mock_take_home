class Subscription < ApplicationRecord
    enum status: [ :cancelled, :active ]
    enum frequency: [ :weekly, :semi_weekly, :monthly, :bi_monthly, :semi_monthly, :semi_anually]


    belongs_to :customer
    belongs_to :tea

    validates_presence_of :title, :description, :frequency, :price, :status

    def self.price_setter(freq)
        price_to_enum_hash = {
            "weekly" => 3500,
            "semi_weekly" => 1800,
            "monthly" => 1250,
            "semi_monthly" => 1500,
            "bi_monthly" => 1000,
            "semi_anually" => 800
        }
        return price_to_enum_hash[freq]
    end
end
