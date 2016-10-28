class Map < ApplicationRecord
  belongs_to :town, optional:true
  validates :x, uniqueness: {scope: :y}

  def getMapData(xc,yc,size)
    map = Map.all
    rendered_tiles = []
    for xval in (xc-(size/2))...(xc+(size/2))
      for yval in (yc-(size/2))...(yc+(size/2))
        rendered_tiles[xval][yval] = map.find {|z| z[:x] == xval && z[:y] == yval}
      end
    end
    if !rendered_tiles[xc][yc].empty?
      return rendered_tiles
    end
  end

end
