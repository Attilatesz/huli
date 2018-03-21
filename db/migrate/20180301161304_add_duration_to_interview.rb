class AddDurationToInterview < ActiveRecord::Migration[5.1]
  def change
    add_column :interviews, :duration, :integer
  end
end
