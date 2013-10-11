describe "RoomView", ->
  Given ->
    @$page = $('<div></div>')
    @$form = @$page.affix('form')
    @$message = @$form.affix('input#message')
    @$history = @$page.affix('ul#history')
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

  describe "Tells what is hears in the room", ->
    Given -> @room.hear = -> ['foo', 'bar']
    When -> @$form.submit()
    Then ->
      expect(@$history.html()).toMatch('foo')
      expect(@$history.html()).toMatch('bar')

    describe "Tells each heard thing only once", ->
      When -> @$form.submit() for i in [1..10]
      Then -> @$history.children().size() == 2
