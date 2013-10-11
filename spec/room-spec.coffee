describe "Room", ->
  Given -> @room = new Room()

  describe "In the beginning the room was filled with silent", ->
    Then -> expect(@room.hear()).toEqual([])

  describe "What is said in the room stays in the room", ->
    When -> @room.say('wazuup!')
    Then -> expect(@room.hear()).toEqual(['wazuup!'])

  describe "Everybody can have their say", ->
    When ->
      @room.say('first!')
      @room.say('second!')
    Then -> expect(@room.hear()).toEqual(['first!', 'second!'])

  describe "Empty words are paid no attention to", ->
    When ->
      @room.say('')
      @room.say(null)
    Then -> expect(@room.hear()).toEqual([])
