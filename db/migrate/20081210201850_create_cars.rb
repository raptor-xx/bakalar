class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.string :SPZ
      t.string :marque
      t.string :car_type
      t.date :manufactured
      t.date :acquisition
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cars
  end
end
