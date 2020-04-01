class RemoveUnnecessaryFileField < ActiveRecord::Migration[6.0]
  def change
    remove_column :drive_files, :path
  end
end
