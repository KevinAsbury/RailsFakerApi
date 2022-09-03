# frozen_string_literal: true

module Types
  class CommunicationType < Types::BaseObject
    field :id, ID, null: false
    field :information, String, null: false
    field :comm_type, String, null: false
    field :sub_type, String
    field :is_primary, Boolean, null: false
    field :can_message, Boolean, null: false
    field :can_call, Boolean, null: false
    field :best_time, String
    field :confirmed, Boolean, null: false
    field :active, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
