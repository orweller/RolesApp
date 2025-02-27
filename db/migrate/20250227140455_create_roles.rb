class CreateRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.datetime :started_at
      t.datetime :ended_at
      t.datetime :archived_at
      t.datetime :deleted_at
      t.integer :user_id

      t.timestamps
    end
  end
end
