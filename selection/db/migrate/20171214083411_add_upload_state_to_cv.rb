class AddUploadStateToCv < ActiveRecord::Migration[5.1]
  def change
    add_column :cvs, :upload_state, :string
  end
end
