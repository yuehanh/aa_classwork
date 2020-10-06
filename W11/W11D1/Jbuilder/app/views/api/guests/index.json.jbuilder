#@guests.each do |guest|
    # json.set! guest.id do
    #     json.partial! 'guest', banana: guest
    # end
    
#end

json.array! @guests, :id, :name, :age, :gifts
# @guests.map do |guest|
    
#     json.partial! 'guest', banana: guest

# end