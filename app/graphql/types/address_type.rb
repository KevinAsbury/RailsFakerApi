# frozen_string_literal: true

module Types
  class AddressType < Types::BaseObject
    field :id, ID, null: false
    field :street_address, String
    field :street_address_secondary, String
    field :city, String
    field :state, String
    field :country, String
    field :zip, String
    field :latitude, String
    field :longitude, String
    field :active, Boolean
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
