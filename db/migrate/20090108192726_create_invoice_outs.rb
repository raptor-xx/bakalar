class CreateInvoiceOuts < ActiveRecord::Migration
  def self.up
    create_table :invoice_outs do |t|
      t.integer :customer_id
      t.string :number
      t.date :exposition
      t.date :maturity
      t.text :description
      t.integer :amount
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :invoice_outs
  end
end
