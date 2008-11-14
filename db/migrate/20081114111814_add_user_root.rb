class AddUserRoot < ActiveRecord::Migration
  def self.up
    User.delete_all
    User.create(:name => 'root', :password => 'root', :password_confirmation => 'root') 
  end

  def self.down
  end
end
