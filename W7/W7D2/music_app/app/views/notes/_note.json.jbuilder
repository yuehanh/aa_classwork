json.extract! note, :id, :user_id, :track_id, :note, :created_at, :updated_at
json.url note_url(note, format: :json)
