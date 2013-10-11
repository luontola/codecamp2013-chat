describe "Room", ->
  Given -> @room = new Room()

  describe "In the beginning there was silence", ->
    Then -> expect(@room.hear()).toEqual([])

  describe "What is said in the room stays in the room", ->
    When -> @room.say('wazuup!')
    Then -> expect(@room.hear()).toEqual(['wazuup!'])

  describe "Everybody is heard in order", ->
    When ->
      @room.say('first!')
      @room.say('second!')
    Then -> expect(@room.hear()).toEqual(['first!', 'second!'])
