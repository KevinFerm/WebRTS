# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #DrawMap
  drawMap(50,50,12)

  #Makes the flash messages disappear
  $('.Flash-dismiss').on "click", ->
    $(this).parent().fadeOut('slow')



#Draw map in a size x size grid, with the coordinates in the middle
#pos 50,50 with a size of 10x(x,y) shows rows 45-55 and + and - 5 in each row from 50
#Probably rewrite in Rails would be better, and then loading partials, then the Map model could be used
drawMap = (x,y,size) ->
  map = $('#game_map')
  map.empty()
  for xval in [(x-(size/2))...(x+(size/2))]
    row = $('<div>').addClass('map_row ' + xval.toString())
    map.append(row)

    for yval in [(y-(size/2))...(x+(size/2))]
      tile = $('<div class="map_tile ' + xval.toString() + ',' + yval.toString() + '">')
      row.append(tile)
      tile.append(xval.toString() + ',' + yval.toString())
      console.log "Drawing Tile"