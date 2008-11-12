class CreateDrivers < ActiveRecord::Migration
  def self.up
    create_table :drivers do |t|
      t.column  :name, :string
      t.column  :surname, :string
      t.column  :personal_number, :integer
      t.column  :driving_licence, :string
      t.column  :phone, :integer
      t.column  :user_id, :integer
    end
  end

  def self.down
    drop_table :drivers
  end
end
