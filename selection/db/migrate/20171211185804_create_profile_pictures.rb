class CreateProfilePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :profile_pictures do |t|

      t.timestamps
    end
  end
end
