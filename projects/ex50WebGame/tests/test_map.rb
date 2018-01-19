require "gothonweb/map"
require "test/unit"

class TestGame < Test::Unit::TestCase
  include Map
  
  def test_room()
    gold = Room.new("GoldRoom",
                    """This room has gold in it you can grab. There's a
              door to the north.""")
    assert_equal("GoldRoom", gold.name)
    assert_equal({}, gold.paths)
  end
  
  def test_room_paths()
    center = Room.new("Center", "Test room in the center.")
    north = Room.new("North", "Test room in the north.")
    south = Room.new("South", "Test room in the south.")
    
    center.add_paths({'north' => north, 'south' => south})
    assert_equal(north, center.go('north'))
    assert_equal(south, center.go('south'))
  end
  
  def test_map()
    start = Room.new("Start", "You can go west and down a hole.")
    west = Room.new("Trees", "There are trees here, you can go east.")
    down = Room.new("Dungeon", "It's dark down here, you can go up.")
    
    start.add_paths({'west' => west, 'down' => down})
    west.add_paths({"east" => start})
    down.add_paths("up" => start)
    
    assert_equal(west, start.go('west'))
    assert_equal(start, start.go('west').go('east'))
    assert_equal(start, start.go('down').go('up'))
  end
  
  def test_gothon_game_map()
    assert_equal(SHOOT_DEATH, START.go('shoot!'))
    assert_equal(DODGE_DEATH, START.go('dodge!'))
    
    room = START.go('tell a joke')
    assert_equal(LASER_WEAPON_ARMORY, room)
    
    room = LASER_WEAPON_ARMORY.go('132')
    assert_equal(THE_BRIDGE, room)
    
    room = THE_BRIDGE.go('slowly place the bomb')
    assert_equal(ESCAPE_POD, room)
    
    #room = ESCAPE_POD.go('2')
    #assert_equal(THE_END_WINNER, room)
    
    room = ESCAPE_POD.go('*')
    assert_equal(THE_END_LOSER, room)
  end
  
  def test_session_loading()
    session = {}
    
    room = Map::load_room(session)
    assert_equal(nil, room)
    
    Map::save_room(session, START)
    room = Map::load_room(session)
    assert_equal(START, room)
    
    room = room.go('tell a joke')
    assert_equal(Map::LASER_WEAPON_ARMORY, room)
    
    Map::save_room(session, room)
    assert_equal(LASER_WEAPON_ARMORY, Map::load_room(session))
  end

end