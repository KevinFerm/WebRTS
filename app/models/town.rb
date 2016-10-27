class Town < ApplicationRecord
  belongs_to :user
  belongs_to :map, optional:true
  validates :x, uniqueness: {scope: :y}
end
