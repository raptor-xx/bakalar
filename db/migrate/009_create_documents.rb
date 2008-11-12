class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.column :earning, :boolean
      t.column :issue, :date
      
    end
  end

  def self.down
    drop_table :documents
  end
end
