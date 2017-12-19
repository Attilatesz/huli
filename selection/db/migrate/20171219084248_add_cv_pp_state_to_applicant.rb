class AddCvPpStateToApplicant < ActiveRecord::Migration[5.1]
  def change
    add_column :applicants, :cv_pp_state, :string
  end
end
