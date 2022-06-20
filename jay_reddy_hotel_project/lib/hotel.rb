require_relative "room"

class Hotel
  
    def initialize(name, hash)
        @name = name
        @rooms = Hash.new 
        hash.each do |room, caps| 
            @rooms[room] = Room.new(caps)
        end
    end

    def name
        @name.split.each { |names| names.capitalize!}.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
    
    if @rooms.keys.include?(room_name)
        return true
    else
        return false
    end

    end

    def check_in(person, room)
        if room_exists?(room)
            if !@rooms[room].full?
                 @rooms[room].add_occupant(person)
                print 'check in successful'
            else
                 print 'sorry, room is full'
            end
        else
            print 'sorry, room does not exist'
        end
    end

    def has_vacancy?
        @rooms.each do |room, cap|
            if cap.occupants.length == @rooms[room].capacity
                return false
            else
                return true
            end
        end
    end

    def list_rooms
        @rooms.keys.each do |room|
            print (room + ".*" + (@rooms[room].available_space).to_s + "\n")
        end
    end


    
    
    
end
