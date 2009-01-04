class Driver < ActiveRecord::Base
  validates_presence_of :personal_id
  validates_numericality_of :personal_id
  validates_numericality_of :phone
  
  def self.get_select(user)
    self.find_all_by_user_id(user).map { |d| [d.personal_id, d.id]  }
  end
end
