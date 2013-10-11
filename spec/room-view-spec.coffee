describe "RoomView", ->
  Given ->
    @$page = $('<div></div>')
    @$message = @$page.affix('input#message')
    #console.log(@$page.html())
  Given ->
    @room = new Room()
    spyOn(@room, 'say')
  Given ->
    @subject = new RoomView(@$page, @room)

  describe "Can say things in the room", ->
    When -> @$message.val('things').submit()
    Then -> expect(@room.say).toHaveBeenCalledWith('things')
