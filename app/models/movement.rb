class Movement < ApplicationRecord
  belongs_to :user, :foreign_key => "from"

  ##This function and the ones I use now make a total of five queries, really should think about another way to do this
  #Calculates time and sends it to the database for the cron job to take over later.
  def self.beginMovement(move_type, units, from_town, to_town, from, to)
    distance = Town.getTownDistance(from_town, to_town)
    time = Time.now
    done_at = time + distance.minutes
    town = Town.find(from_town)
    if Movement.create(move_type: move_type,
                       units: units.to_json,
                       from_town: from_town,
                       to_town: to_town,
                       from: from,
                       to: to,
                       done_at: done_at.to_i)
      puts "Saved DB!!!!!"
      curr_pop = eval(town.population)  #again eval function
      curr_pop.each do |unit, value|
        curr_pop[unit] = units[unit] - value.to_i
      end
      town.population = curr_pop.to_json
      town.save
      return true
    else
      return false
    end
  end

  def self.getIncomingByUserId(user_id)
    return Movement.where(to:user_id)
  end

  def self.getOutgoingByUserId(user_id)
    return Movement.where(from:user_id)
  end

  def self.moveHandler
    movements = Movement.all
    movements.each do |movement|
      time = Time.now.to_i
      from_town = Town.find(movement.from_town)
      to_town = Town.find(movement.to_town)
      if time - movement.done_at >= 0
        case movement.move_type
          when true
            #Attack code here -- Later
          when false
            units = eval(movement.units)
            units.each do |unit, value|
              to_town.units[unit] = to_town.units[unit] + value
            end
            to_town.units = to_town.units.to_json
        end
        if to_town.save
          movement.destroy
        end
      end
    end
  end

end