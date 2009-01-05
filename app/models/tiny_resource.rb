class TinyResource < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :initial_value
  validates_numericality_of :order
end
