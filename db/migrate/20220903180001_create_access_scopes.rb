class CreateAccessScopes < ActiveRecord::Migration[7.0]
  def change
    create_table :access_scopes, id: :uuid do |t|
      t.string :handle, index: { unique: true, name: 'unique_access_scopes' }

      t.timestamps
    end
  end
end
