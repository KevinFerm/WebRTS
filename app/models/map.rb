class Map < ApplicationRecord
  belongs_to :town, optional:true
  validates :x, uniqueness: {scope: :y}
  attr_accessor :town

  def self.getMapData(xc,yc,size)
    xc = xc.to_i
    yc= yc.to_i
    size = size.to_i
    map = Map.where(:x => (xc-(size.to_i/2))..(xc+(size/2)), :y => (yc-(size/2))...(yc+(size/2)))
    towns = Town.where(:x => (xc-(size.to_i/2))..(xc+(size/2)), :y => (yc-(size/2))...(yc+(size/2)))
    rendered_tiles = []
    for xval in (xc-(size.to_i/2))...(xc+(size/2))
      tiles = []
      for yval in (yc-(size/2))...(yc+(size/2))
        tile = map.find {|z| z[:x] == xval && z[:y] == yval}
        town = towns.find {|z| z[:x] == xval && z[:y] == yval}

        if town
          tile.town = town
        end

        if !tile.nil?
          tiles << tile

          #rendered_tiles[xval][tile.id] = tile
        end
      end

      rendered_tiles << tiles
    end
    if rendered_tiles
      return rendered_tiles
    end
  end

end
