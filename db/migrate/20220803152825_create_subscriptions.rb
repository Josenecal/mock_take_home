class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.string :description
      t.integer :frequency
      t.integer :price
      t.integer :status
      t.timestamps
      t.references :customers, foreign_key: true
      t.references :teas, foreign_key: true
    end
  end
end
