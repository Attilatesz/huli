class AddIndexToDrtHash < ActiveRecord::Migration[5.1]
  def change
    add_index :drts, :drt_hash, unique: true
  end
end
