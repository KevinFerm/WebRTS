class Movement < ApplicationRecord
  belongs_to :user, :foreign_key => "from"

  def beginMovement(type)
end
