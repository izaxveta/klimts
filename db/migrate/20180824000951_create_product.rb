class CreateProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.integer :quantity, default: 0
      t.integer :status, default: 0
    end
  end
end
