class Attendance < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :attendance, presence: true

end
