require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :invoices
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  
  def validate
    errors.add_to_base("Chybějící heslo") if hashed_password.blank?
  end
  
  def self.authenticate(name, password)
    user = self.find_by_name(name)
    if user
      expected_password = encrypted_password(password)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end
  
  def password
    @password
  end
  
  def password=(passw)
    @password = passw
    return if passw.blank?
    self.hashed_password = User.encrypted_password(self.password)
  end
  
  private
  
  def self.encrypted_password(password)
    Digest::SHA1.hexdigest(password)
  end
end
