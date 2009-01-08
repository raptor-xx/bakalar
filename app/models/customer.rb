class Customer < ActiveRecord::Base
  validates_presence_of :company
  validates_numericality_of :street_number
  validates_numericality_of :phone
  validates_numericality_of :fax
  validates_numericality_of :ICO
  
  def self.get_select(user)
    self.find_all_by_user_id(user).map { |c| [c.company, c.id]  }
  end
end
