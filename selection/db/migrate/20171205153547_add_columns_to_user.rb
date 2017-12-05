class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :github_handle, :string
    add_column :users, :full_name, :string
    add_column :users, :access_token, :string
  end
end
