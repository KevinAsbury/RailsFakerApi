class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, index: { unique: true, name: 'unique_emails' }
      t.string :username, index: { unique: true, name: 'unique_usernames' }
      t.string :password_digest, null: false
      t.boolean :confirmed, null: false, default: false
      t.boolean :active, null: false, default: true
      t.timestamps
    end
  end
end
