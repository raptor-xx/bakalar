class InvoiceIn < ActiveRecord::Base
  validates_numericality_of :amount
end
