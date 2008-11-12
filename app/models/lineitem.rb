class Lineitem < ActiveRecord::Base
  belongs_to :invoice
end
