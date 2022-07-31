require 'faker'
require 'action_view'
require 'securerandom'
include ActionView::Helpers::TextHelper

def random_pick(arr)
  length = arr.length
  choice = Faker::Number.between(from: 0, to: arr.length - 1)
  arr[choice]
end

count = 100
puts("There are #{pluralize(Communication.all.count, 'communication')}.")
return unless Communication.all.count < count

n = count - Communication.all.count
puts "Adding #{pluralize(n, 'communication')} to the table."
n.times do
  comm_type_pick = random_pick(%w[email phone])
  sub_type = nil
  comm_can_call = false
  best_time = nil

  case comm_type_pick
  when 'email'
    sub_type = random_pick(%w[personal business additional])
  when 'phone'
    sub_type = random_pick(%w[mobile home work additional])
    comm_can_call = Faker::Boolean.boolean
    best_time = random_pick(%w[morning afternoon evening])
  end

  Communication.create(
    id: SecureRandom.uuid,
    information: Faker::Internet.email,
    comm_type: comm_type_pick,
    sub_type: sub_type,
    is_primary: Faker::Boolean.boolean,
    can_message: Faker::Boolean.boolean,
    can_call: comm_can_call,
    best_time: best_time,
    confirmed: true,
    active: Faker::Boolean.boolean
  )
rescue StandardError => e
  p "users_seed::User.create => exception #{e.class.name} : #{e.message}"
end
