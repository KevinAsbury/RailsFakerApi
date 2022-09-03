module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :addresses, [Types::AddressType], null: false
    def addresses
      Address.all
    end

    field :address, Types::AddressType, null: false do
      argument :id, ID, required: true
    end
    def address(id:)
      Address.find(id)
    end

    field :communications, [Types::CommunicationType], null: false
    def communications
      Communication.all
    end

    field :communications_by, [Types::CommunicationType], null: false do
      argument :type, String, required: false
      argument :active, Boolean, required: false
    end
    def communications_by(type:, active:)
      Communication.where(comm_type: type, active: active)
    end

    field :communication, Types::CommunicationType, null: false do
      argument :id, ID, required: true
    end
    def communication(id:)
      Communication.find(id)
    end

    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end
  end
end
