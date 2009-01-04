class Cashbook < ActiveRecord::Base
  validates_presence_of :what
  validates_numericality_of :amount
  validates_numericality_of :order
end
