class Building < ApplicationRecord
  belongs_to :user
  belongs_to :town

  def self.build(unit, town_id, user_id, amount)
    time = Time.now
    #Validate type
    for x in 1..amount.to_i
      done_at = time + x.to_i.minutes
      Building.create(unit: unit, town_id: town_id, user_id: user_id, done_at: done_at.to_i, amount: 1)
    end
  end

  #Cron Job for handling the building of troops and adding them to the right towns at the right time
  #As whenever can only do 1.minute at the least (I think? Will check later), the precision will be low for the time being
  #Also run on node.js server from GET request since I'm on windows
  def self.buildHandler
    buildings = Building.all
    buildings.each do |building|
      time = Time.now.to_i
      if time-building.done_at >= 0
        town = Town.find(building.town_id)
        if town.population.nil?
          town.population = "{}"
        end
        pop = JSON.parse(town.population)
        unit = Unit.find(building.unit)
        if pop[building.unit]
          amount = pop[unit.name] + 5
        else
          pop.store(unit.name, 5)
        end
        town.population = pop.to_json
        if town.save
          puts "Saved building, now destroying entry"
          building.destroy
        end
      end
    end
  end

end
