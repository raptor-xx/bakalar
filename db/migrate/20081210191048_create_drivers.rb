class CreateDrivers < ActiveRecord::Migration
  def self.up
    create_table :drivers do |t|
      t.string :name
      t.string :surname
      t.integer :personal_id
      t.string :driving_licence
      t.integer :phone
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :drivers
  end
end
