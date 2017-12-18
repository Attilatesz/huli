class AddProfilePictureToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :profile_pictures, :user, foreign_key: true
  end
end
