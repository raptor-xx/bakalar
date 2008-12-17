class CreateJourneys < ActiveRecord::Migration
  def self.up
    create_table :journeys do |t|
      t.datetime :begun
      t.datetime :finished
      t.string :from_where
      t.string :to_where
      t.text :purpose
      t.integer :driver_id
      t.integer :car_id
      t.integer :tachymetr_before
      t.integer :tachmetr_after
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :journeys
  end
end
