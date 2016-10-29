class Building < ApplicationRecord
  belongs_to :user
  belongs_to :town

  def self.build(type, town_id, user_id, amount)
    time = Time.now
    done_at = time + amount.to_i.minutes
    #Validate type
    if(type == "bowmen" || type == "swordsmen")
      Building.create(troop_type: type, town_id: town_id, user_id: user_id, done_at: done_at.to_i, amount: amount)
      return true
    else
      return false
    end
  end

end
