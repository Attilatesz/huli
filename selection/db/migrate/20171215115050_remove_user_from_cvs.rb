class RemoveUserFromCvs < ActiveRecord::Migration[5.1]
  def change
    remove_reference :cvs, :user, foreign_key: true
  end
end
