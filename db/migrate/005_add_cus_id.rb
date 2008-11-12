class AddCusId < ActiveRecord::Migration
  def self.up
    add_column :invoices, :customer_id, :integer
  end

  def self.down
    remove_column :invoices, :customer_id
  end
end
