require 'faker'
require 'action_view'
require 'securerandom'
include ActionView::Helpers::TextHelper

count = 101
puts("There are #{pluralize(User.all.count, 'user')}.")
return unless User.all.count < count

n = count - User.all.count
puts "Adding #{pluralize(n, 'user')} to the table."
n.times do
  User.create(
    id: SecureRandom.uuid,
    email: Faker::Internet.unique.email,
    username: Faker::Internet.unique.username,
    password: 'password',
    confirmed: true,
    active: true
  )
rescue StandardError => e
  p "users_seed::User.create => exception #{e.class.name} : #{e.message}"
end
