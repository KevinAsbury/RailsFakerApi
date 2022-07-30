require 'faker'
require 'action_view'
require 'securerandom'
include ActionView::Helpers::TextHelper

count = 100
puts("There are #{pluralize(Address.all.count, 'address')}.")
return unless Address.all.count < count

n = count - Address.all.count
puts "Adding #{pluralize(n, 'address')} to the table."
n.times do
  Address.create(
    id: SecureRandom.uuid,
    street_address: Faker::Address.street_address,
    street_address_secondary: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
    country: Faker::Address.country_code,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    active: true
  )
rescue StandardError => e
  p "users_seed::User.create => exception #{e.class.name} : #{e.message}"
end
