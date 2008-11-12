class CreateJourneys < ActiveRecord::Migration
  def self.up
    create_table :journeys do |t|
      t.column :car_id, :integer
      t.column :begun, :datetime
      t.column :finished, :datetime
      t.column :from_where, :string
      t.column :where, :string
      t.column :purpose, :text
      t.column :driver_id, :integer
      t.column :tachymeter_before, :integer
      t.column :tachymeter_after, :integer
      t.column :user_id, :integer
    end
  end

  def self.down
    drop_table :journeys
  end
end
