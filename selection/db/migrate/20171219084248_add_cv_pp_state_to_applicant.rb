class AddCvPpStateToApplicant < ActiveRecord::Migration[5.1]
  def change
    add_column :applicants, :status, :string
  end
end
