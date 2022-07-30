json.extract! address, :id, :street_address, :street_address_secondary, :city, :state, :country, :zip, :latitude, :longitude, :active, :created_at, :updated_at
json.url address_url(address, format: :json)
