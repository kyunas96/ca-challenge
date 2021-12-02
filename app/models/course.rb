class Course < ApplicationRecord
  validates :name, presence: true
  validates :release_date, presence: true
end
