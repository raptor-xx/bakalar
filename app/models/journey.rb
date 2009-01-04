class Journey < ActiveRecord::Base
  validates_numericality_of :tachymetr_before
  validates_numericality_of :tachymetr_after
end
