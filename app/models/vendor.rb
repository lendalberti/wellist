class Vendor < ApplicationRecord

  has_many :wellists
  belongs_to :care_type, optional: true
  belongs_to :care_sub_type, optional: true
  belongs_to :category, optional: true
  
end