class CreateReceivers < ActiveRecord::Migration[5.2]
  def change
    create_table :receivers do |t|
      t.integer :customer_id
      t.string :name
      t.integer :postal_code
      t.string :address

      t.timestamps
    end
  end
end
