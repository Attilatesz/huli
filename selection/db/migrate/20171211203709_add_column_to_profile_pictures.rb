class AddColumnToProfilePictures < ActiveRecord::Migration[5.1]
  def change
    add_column :profile_pictures, :upload_state, :string
  end
end
