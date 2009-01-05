class CreateTinyResources < ActiveRecord::Migration
  def self.up
    create_table :tiny_resources do |t|
      t.integer :order
      t.string :name
      t.date :formatting
      t.integer :initial_value
      t.date :disposal
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tiny_resources
  end
end
