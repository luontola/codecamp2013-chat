class @Room

  constructor: ->
    @messages = []

  say: (message) ->
    @messages.push(message)

  hear: -> @messages
