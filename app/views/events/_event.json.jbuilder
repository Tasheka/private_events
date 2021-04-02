json.extract! event, :id, :location, :date, :name, :description, :created_at, :updated_at
json.url event_url(event, format: :json)
