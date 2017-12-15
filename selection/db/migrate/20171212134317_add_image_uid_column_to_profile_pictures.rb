class AddImageUidColumnToProfilePictures < ActiveRecord::Migration[5.1]
  def change
    add_column :profile_pictures, :image_uid, :string
  end
end
