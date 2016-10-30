class Movement < ApplicationRecord
  belongs_to :user, :foreign_key => "from"

  ##This function and the ones I use now make a total of five queries, really should think about another way to do this
  #Calculates time and sends it to the database for the cron job to take over later.
  def self.beginMovement(move_type, bowmen, swordsmen, from_town, to_town, from, to)
    distance = Town.getTownDistance(from_town, to_town)
    time = Time.now
    done_at = time + distance.minutes
    town = Town.find(from_town)
    if(town.swordsmen >= swordsmen && town.bowmen >= bowmen)
      if Movement.create(move_type: move_type,
                         bowmen: bowmen,
                         swordsmen: swordsmen,
                         from_town: from_town,
                         to_town: to_town,
                         from: from,
                         to: to,
                         done_at: done_at.to_i)
        town.swordsmen = (town.swordsmen-swordsmen)
        town.bowmen = (town.bowmen-bowmen)
        town.save
        return true
      else
        return false
      end
    end

  end

end
