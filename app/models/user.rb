class User < ApplicationRecord

  has_secure_password
  has_secure_token :auth_token
  validates_uniqueness_of :studentnum


  validates :studentnum, presence: true
  validates :firstname, presence: true
   validates :middlename, presence: true
  validates :lastname, presence: true
  validates :sectionname, presence: true
  validates :password_digest, presence: true


end
