class Attendance < ApplicationRecord

  validates :date, presence: true
  validates :time, presence: true
  validates :studentnum, presence: true
  validates :firstname, presence: true
  validates :middlename, presence: true
  validates :lastname, presence: true
  validates :attendance, presence: true

end
