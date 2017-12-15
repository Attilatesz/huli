class AddProfilePictureToApplicants < ActiveRecord::Migration[5.1]
  def change
    add_reference :applicants, :profile_picture, foreign_key: true
  end
end
