class Map < ApplicationRecord
  belongs_to :town, optional:true
  validates :x, uniqueness: {scope: :y}
end
