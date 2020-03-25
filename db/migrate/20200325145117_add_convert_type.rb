class AddConvertType < ActiveRecord::Migration[6.0]
  def change
    add_column :drive_files, :convert_type, :string
  end
end
