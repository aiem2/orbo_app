json.extract! prospect, :id, :name, :email, :area, :liason_name, :liason_phone, :liason_mail, :logo_url, :web, :fb, :ig, :description, :address, :city, :state, :created_at, :updated_at
json.url prospect_url(prospect, format: :json)
