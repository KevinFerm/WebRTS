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
      curr_pop = eval(town.population)  #again eval function
      curr_pop.each do |unit, value|
        if units[unit].to_i >= value.to_i
          curr_pop[unit] = units[unit].to_i - value.to_i
        end
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

  def self.attackHandler(from_town, to_town, data)
    #Vars
    #data is everything relating to the specifics of the attack, meaning attack numbers, when it happens etc.
    units = Unit.all #Get all units to compare and get effects
    defending_pop = eval(to_town.population)#Evil eval
    attacking_pop = eval(data.units)#Evil eval
    #Setup
      #Get all units from the data and set them up with variables for health, speed, damage etc
      #Unit vars are multiplied by the amount of that unit that are present in the attack

  end

  #Calculates total damage of a unit versus another unit and returns the winner minus the amount of troops he would have lost
  def self.damageCalculator(attacking, defending)

  end

  #Handles troop movements between towns
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
            units = eval(movement.units) #Evil eval again
            if !to_town.population
              to_town.population = "{}"
            end
            pop = eval(to_town.population) #Another evil eval
            units.each do |unit, value|
              if pop[unit]
                pop[unit] += value.to_i
              else
                pop.store(unit, value.to_i)
              end
            end
            to_town.population = pop.to_json
        end
        if to_town.save
          movement.destroy
        end
      end
    end
  end

end