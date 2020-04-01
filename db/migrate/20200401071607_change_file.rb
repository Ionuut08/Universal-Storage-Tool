class ChangeFile < ActiveRecord::Migration[6.0]
  def change
    add_column :drive_files, :filey, :string
  end
end
