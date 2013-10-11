describe "RoomView", ->
  Given ->
    @$page = $('<div></div>')
    @$form = @$page.affix('form input#message')
    @$message = @$form.find('#message')
    #console.log(@$page.html())
  Given ->
    @room = new Room()
    spyOn(@room, 'say')
  Given ->
    @subject = new RoomView(@$page, @room)

  describe "Can say things in the room", ->
    When -> @$message.val('things').submit()
    Then -> expect(@room.say).toHaveBeenCalledWith('things')

    describe "After a thing has been said, there is no point in saing it again", ->
      Then -> @$message.val() == ''
