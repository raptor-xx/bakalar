class CreateLongtimeResources < ActiveRecord::Migration
  def self.up
    create_table :longtime_resources do |t|
      t.string :name
      t.integer :initial_value
      t.date :when
      t.integer :depreciation_group
      t.integer :depreciation_type
      t.integer :first_rate
      t.integer :continue_rate
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :longtime_resources
  end
end
