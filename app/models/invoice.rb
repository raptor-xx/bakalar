class Invoice < ActiveRecord::Base
  belongs_to :user
  has_many :lineitems
end
