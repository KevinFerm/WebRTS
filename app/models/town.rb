class Town < ApplicationRecord
  belongs_to :user, optional:true
  belongs_to :map, optional:true
  has_many :buildings
  validates :x, uniqueness: {scope: :y}

  def self.getTownDistance(town1_id, town2_id)
    town1 = Town.find(town1)
    town2 = Town.find(town2)
    return (town2.x - town1.x) + (town2.y - town1.y)
  end

end
