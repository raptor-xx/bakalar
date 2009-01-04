class Car < ActiveRecord::Base
  def self.get_select(user)
    self.find_all_by_user_id(user).map { |c| [c.SPZ, c.id]  }
  end
end
