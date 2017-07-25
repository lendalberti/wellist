class Wellist < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :vendor, optional: true

end