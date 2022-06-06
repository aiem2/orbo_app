json.extract! content, :id, :title, :date, :description, :download, :city, :state, :created_at, :updated_at
json.url content_url(content, format: :json)
