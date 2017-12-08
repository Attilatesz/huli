class RemoveColumnsUserDevise < ActiveRecord::Migration[5.1]
  def change
    ## Database authenticatable
    remove_column :users, :encrypted_password, type: :string, options: { null: false, default: '' }

    ## Recoverable
    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :datetime
  end
end
