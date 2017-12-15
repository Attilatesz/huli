class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :options, :type, :category
  end
end
