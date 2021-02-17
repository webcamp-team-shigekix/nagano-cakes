class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :product_type_id
      t.string :name
      t.text :description
      t.integer :price
      t.text :image_id
      t.boolean :is_active
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
