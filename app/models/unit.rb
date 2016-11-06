class Unit < ApplicationRecord

  def self.getUnitName(id)
    return Unit.find(id).name
  end

  ##Effect functions below? How to do this the best way?

end
