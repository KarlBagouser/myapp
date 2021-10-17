class CreateOrder < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :users
      t.timestamps
    end

    create_table :orders_descriptions do |t|
      t.belongs_to :orders
      t.belongs_to :items
      t.integer :quantity
      t.timestamps
    end
  end
end
