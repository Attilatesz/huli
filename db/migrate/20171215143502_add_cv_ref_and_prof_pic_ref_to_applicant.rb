class AddCvRefAndProfPicRefToApplicant < ActiveRecord::Migration[5.1]
  def change
    add_reference :profile_pictures, :applicant, foreign_key: true
    add_reference :cvs, :applicant, foreign_key: true
  end
end
