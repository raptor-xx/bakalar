class LongtimeResource < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :initial_value
  validates_numericality_of :first_rate
  validates_numericality_of :continue_rate
end
