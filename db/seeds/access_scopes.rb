require 'faker'
require 'action_view'
require 'securerandom'
include ActionView::Helpers::TextHelper

count = 100
puts("There are #{pluralize(AccessScope.all.count, 'access_scope')}.")
return unless AccessScope.all.count < count

verbs = ["view", "create", "modify", "remove"];

nouns = [
  "accounts",
  "analytics",
  "billing",
  "categories",
  "checkout",
  "contracts",
  "customers",
  "departments",
  "discounts",
  "employees",
  "equipment",
  "events",
  "inventory",
  "invoices",
  "jobs",
  "locations",
  "marketing",
  "materials",
  "orders",
  "payments",
  "pricing",
  "product_listing",
  "products",
  "publications",
  "receiving",
  "reports",
  "sales",
  "segments",
  "services",
  "shipping",
  "subscriptions",
  "taxes",
  "translations",
  "users",
  "vendors",
];

existing_scopes = []
AccessScope.all.each do |scope| 
  scope.attributes.each do |k,v|
    existing_scopes.push(v) unless k != "handle"
  end
end

new_scopes = []

n = count - AccessScope.all.count
puts "Adding #{pluralize(n, 'access_scope')} to the table."

n.times do
  duplicate = true
  while duplicate do
    rando_verb = verbs[Faker::Number.between(from: 0, to: verbs.length - 1)];
    rando_noun = nouns[Faker::Number.between(from: 0, to: nouns.length - 1)];
    rando_handle = "#{rando_verb}_#{rando_noun}"
    duplicate = new_scopes.include?(rando_handle) || existing_scopes.include?(rando_handle)
    new_scopes.push(rando_handle) unless duplicate
  end
end

new_scopes.each do |new_handle|
  AccessScope.create(
    id: SecureRandom.uuid,
    handle: new_handle
  )
rescue StandardError => e
  p "access_scopes_seed::AccessScope.create => exception #{e.class.name} : #{e.message}"
end
