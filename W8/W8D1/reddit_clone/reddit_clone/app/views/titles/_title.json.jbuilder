json.extract! title, :id, :url, :content, :sub_id, :author_id, :created_at, :updated_at
json.url title_url(title, format: :json)
