class Town < ApplicationRecord
  belongs_to :user, optional:true
  belongs_to :map, optional:true
  has_many :buildings
  validates :x, uniqueness: {scope: :y}



end
