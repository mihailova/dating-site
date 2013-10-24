# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'click', 'a.popup', (e) ->
    e.preventDefault()
    that = $(this)

    href = that.attr 'href'
    width = that.data 'width'
    height = that.data 'height'

    left = (screen.width/2) - (width/2)
    top = (screen.height/2) - (height/2)

    window.open href, 'login', "menubar=no,toolbar=no,status=no,width=#{width},height=#{height},toolbar=no,left=#{left},top=#{top}"

    false