class Customer < ActiveRecord::Base
  validates_presence_of :company
  validates_numericality_of :street_number
  validates_numericality_of :phone
  validates_numericality_of :fax
  validates_numericality_of :ICO
end
