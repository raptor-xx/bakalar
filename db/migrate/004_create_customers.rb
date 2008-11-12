class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.column :company, :string
      t.column :street, :string
      t.column :street_number, :integer
      t.column :town, :string
      t.column :phone, :integer
      t.column :email, :string
      t.column :fax, :integer
      t.column :web, :string
      t.column :ICO, :integer
      t.column :DIC, :integer
      t.column :user_id, :integer
    end
  end

  def self.down
    drop_table :customers
  end
end
