class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.column :Description,  :string
      t.column :IssueDate, :date
      t.column :shipmentdate, :date
      t.column :user_id, :integer
    end
  end

  def self.down
    drop_table :invoices
  end
end
