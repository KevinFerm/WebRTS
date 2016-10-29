class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :towns
  has_many :buildings
  has_many :movements, :foreign_key => "from"
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
