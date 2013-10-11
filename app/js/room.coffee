class @Room

  constructor: ->
    @messages = []

  say: (message) ->
    @messages.push(message) if message

  hear: -> @messages
