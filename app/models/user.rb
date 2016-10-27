class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, uniqueness: {case_sensitive: false, uniq:true}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save do
    self.username.downcase! if self.username
  end

  def isAdmin?
    if self.permissions >= 0
      return true
    else
      return false
    end
  end
end
