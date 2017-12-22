class RenameCvPpStateToStatus < ActiveRecord::Migration[5.1]
  def change
    rename_column :applicants, :cv_pp_state, :status
  end
end
