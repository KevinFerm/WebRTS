class Town < ApplicationRecord
  belongs_to :user, optional:true
  belongs_to :map, optional:true
  has_many :buildings
  validates :x, uniqueness: {scope: :y}

  #Again lots of queries. Reminder: Come back and check on this function
  def self.getTownDistance(town1_id, town2_id)
    town1 = Town.find(town1_id)
    town2 = Town.find(town2_id)
    puts ((town2.x - town1.x) + (town2.y - town1.y)).abs
    return ((town2.x - town1.x) + (town2.y - town1.y)).abs
  end

  def self.addTownOnRegister(user_id)
    x = rand(0...99)
    y = rand(0...99)
    if Town.where(x:x,y:y)
      self.addTownOnRegister(user_id)
    else
      Town.create(user_id:user_id,x:x,y:y,level:3)
    end
  end

end
