class @RoomView

  constructor: (@$page, @room) ->
    @$message = @$page.find("#message")
    @$message.closest('form').submit =>
      @say()
      false
    @$history = @$page.find("#history")

  say: ->
    message = @$message.val()
    @room.say(message)
    @$message.val('')
    @refreshHistory()

  refreshHistory: ->
    @$history.empty()
    for heard in @room.hear()
      @$history.append($('<li></li>').text(heard))
