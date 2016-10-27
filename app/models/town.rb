class Town < ApplicationRecord
  belongs_to :user
  validates :x, uniqueness: {scope: :y}
end
