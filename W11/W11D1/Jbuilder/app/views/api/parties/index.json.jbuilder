@parties.each do |apple|
    json.set! apple.id do
        json.partial! 'party', party: apple
    end
end