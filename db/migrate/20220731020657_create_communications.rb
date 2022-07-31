class CreateCommunications < ActiveRecord::Migration[7.0]
  def change
    create_table :communications, id: :uuid do |t|
      t.string :information, null: false, index: true
      t.string :comm_type, null: false, index: true
      t.string :sub_type
      t.boolean :is_primary, null: false, default: false
      t.boolean :can_message, null: false, default: false
      t.boolean :can_call, null: false, default: false
      t.string :best_time
      t.boolean :confirmed, null: false, default: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
