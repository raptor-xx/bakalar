class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.column :SPZ, :string
      t.column :marque, :string
      t.column :type, :string
      t.column :manufactured, :date
      t.column :acquisition, :date
      t.column  :user_id, :integer
    end
  end

  def self.down
    drop_table :cars
  end
end
