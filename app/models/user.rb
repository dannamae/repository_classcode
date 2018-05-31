class User < ApplicationRecord
  has_secure_token :auth_token
  validates_uniqueness_of :studentnum
  has_many :attendances

  def invalidate_token
    self.update_columns(auth_token: nil)
  end

  def self.valid_login?(studentnum)
    user = find_by(studentnum: studentnum)
  end


  validates :studentnum, presence: true
  validates :firstname, presence: true
  validates :middlename, presence: true
  validates :lastname, presence: true

end
