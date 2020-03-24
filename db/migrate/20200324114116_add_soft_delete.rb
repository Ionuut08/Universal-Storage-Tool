class AddSoftDelete < ActiveRecord::Migration[6.0]
  def change
    add_column :drive_files, :is_deleted, :boolean, default: false
  end
end
