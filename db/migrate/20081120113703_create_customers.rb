class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :company
      t.string :street
      t.integer :street_number
      t.string :town
      t.integer :phone
      t.string :email
      t.integer :fax
      t.string :web
      t.integer :ICO
      t.integer :DIC
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
