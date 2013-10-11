$(document).ready(=>
  room = new Room()
  new RoomView($('body'), room)
  @room = room
)
