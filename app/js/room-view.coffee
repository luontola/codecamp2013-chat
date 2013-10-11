class @RoomView

  constructor: (@$page, @room) ->
    @$message = @$page.find("#message")
    @$message.submit(=> @say())

  say: ->
    message = @$message.val()
    @room.say(message)
