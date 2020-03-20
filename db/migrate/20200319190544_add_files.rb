class AddFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :drive_files do |t|
      t.string :path
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
