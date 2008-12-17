class CreateCashbooks < ActiveRecord::Migration
  def self.up
    create_table :cashbooks do |t|
      t.integer :movement
      t.date :when
      t.integer :where
      t.integer :amount
      t.integer :DPH
      t.text :comment
      t.integer :customer_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cashbooks
  end
end
