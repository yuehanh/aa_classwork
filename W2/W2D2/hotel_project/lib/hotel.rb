require_relative "room"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = {}
    rooms.each_key {  |key|  @rooms[key] = Room.new(rooms[key]) }
  end

  def name
    @name.split.map(&:capitalize).join(' ')
  end

  def rooms 
    @rooms
  end

  def room_exists?(name)
    rooms.key?(name)
  end
  
  def check_in(person, room_name)
    if room_exists?(room_name)
        if rooms[room_name].add_occupant(person)
            p 'check in successful' 
        else
            p 'sorry, room is full'
        end
    else
        p 'sorry, room does not exist.'
    end
    end

    def has_vacancy?
        rooms.values.any? {|val| !val.full?} 
    end

    def list_rooms
        rooms.each_key{|key| print "#{key} #{rooms[key].available_space}\n"}
    end
end




