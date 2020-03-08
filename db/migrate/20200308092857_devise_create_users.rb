# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :google_id, null: false
      t.string :name, null: true
      t.string :avatar_url, null: true

      t.timestamps null: false
    end

    add_index :users, :google_id, unique: true
    add_index :users, :email, unique: true
  end
end
