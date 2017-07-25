class User < ApplicationRecord

  has_many :wellists
  belongs_to :care_type, optional: true
  belongs_to :care_sub_type, optional: true

end