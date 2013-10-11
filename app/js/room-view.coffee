class @RoomView

  constructor: (@$page, @room) ->
    @$message = @$page.find("#message")
    @$message.closest('form').submit =>
      @say()
      false

  say: ->
    message = @$message.val()
    @room.say(message)
    @$message.val('')
    #console.log("said "+message)
    #console.log("heard "+@room.hear())
