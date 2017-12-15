class AddApplicantsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :applicant, foreign_key: true
  end
end
