class AddCvsToApplicants < ActiveRecord::Migration[5.1]
  def change
    add_reference :applicants, :cv, foreign_key: true
  end
end
