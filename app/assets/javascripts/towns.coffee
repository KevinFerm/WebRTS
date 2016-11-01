# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#Turbolinks event listener, DOM READY
document.addEventListener 'turbolinks:load', ->

  $("#quick_one").on "click", ->
    form = $(this).parent()
    form.find("#quick_value").val(1)
    form.submit()

  $("#quick_half").on "click", ->
    form = $(this).parent()
    form.find("#quick_value").val($(this).val())
    form.submit()

  $("#quick_all").on "click", ->
    form = $(this).parent()
    form.find("#quick_value").val($(this).val())
    form.submit()

  userid = $('#user_id').attr('userid')
  if userid
    select_town = $('#support_from_town')
    $.ajax '/town/gettowns/'+userid.toString(),
      type: 'GET',
      dataType: 'json'
      success: (data, textStatus, jqXHR) ->
        select = $('<select name="from_town_id" id="from_town_id">')
        select_town.append(select)
        for k,v of data
          town = $('<option value="' +v.id.toString()+ '">'+v.title.toString()+'</option>')
          select.append(town)

  #COUNTDOWN STUFF
  countdowns = document.getElementsByClassName("countdown")
  for i in [0...countdowns.length]
    CountDownTimer countdowns[i].id, countdowns[i]

CountDownTimer = (dt, selector) ->
  end = new Date(dt*1000) #Unix timestamp from the DB
  _second = 1000
  _minute = _second * 60
  _hour = _minute * 60
  _day = _hour * 24
  showRemaining = ->
    now = new Date()
    distance = end - now
    if distance <= 0
      clearInterval timer
      selector.innerHTML = "Now!"
      return
    days = Math.floor(distance / _day)
    hours = Math.floor((distance % _day) / _hour)
    minutes = Math.floor((distance % _hour) / _minute)
    seconds = Math.floor((distance % _minute) / _second)
    selector.innerHTML = days + "days " + hours + "hrs " + minutes + "mins " + seconds + "secs"

  timer = setInterval showRemaining, 1000

getTownsFromUser = (user_id) ->
  dat = ''
  $.ajax '/town/gettowns/'+user_id.toString(),
    type: 'GET',
    dataType: 'json'
    success: (data, textStatus, jqXHR) ->
      console.log dat = data
      return
  return dat



