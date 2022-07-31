json.extract! communication, :id, :information, :comm_type, :sub_type, :is_primary, :can_message, :can_call, :best_time, :confirmed, :active, :created_at, :updated_at
json.url communication_url(communication, format: :json)
