class Unit < ApplicationRecord
  def self.getUnitName(id)
    return Unit.find(id).name
  end
end
