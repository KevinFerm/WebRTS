# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #DrawMap
  drawMap(100)
  #Makes the flash messages disappear
  $('.Flash-dismiss').on "click", ->
    $(this).parent().fadeOut('slow')


###Draw the Map###
drawMap = (mapSize) ->
  map = $('#game_map')
  for x in [0...mapSize]
    row = $('<div>').addClass('map_row ' + x.toString())
    map.append(row)
    for y in [0...mapSize]
      tile = $('<div class="map_tile x_' + x.toString() + ' y_' + y.toString() + '">')
      row.append(tile)
      console.log "Draw tile"
