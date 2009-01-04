class CreateCashbooks < ActiveRecord::Migration
  def self.up
    create_table :cashbooks do |t|
      t.string :what
      t.date :when
      t.integer :order
      t.integer :amount
      t.text :comment
      t.integer :movement
      t.integer :where
      t.integer :investment
      t.integer :changes_base
      t.integer :DPH
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cashbooks
  end
end
