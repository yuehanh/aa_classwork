@gifts.each do |banana|
  json.set! banana.id do
    json.partial! 'gift', gift: banana
  end
end

# remember to nest the gifts under the guest