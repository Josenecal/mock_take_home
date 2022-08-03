class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.string :description
      t.integer :frequency
      t.integer :price
      t.integer :status
      t.timestamps
      t.references :customer, foreign_key: true
      t.references :tea, foreign_key: true
    end
  end
end
