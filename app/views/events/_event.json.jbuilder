json.extract! event, :id, :type, :gestor, :private, :start, :end, :created_at, :updated_at
json.url event_url(event, format: :json)
