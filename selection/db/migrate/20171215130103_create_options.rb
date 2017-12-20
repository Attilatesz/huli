class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.string :type
      t.string :name
      t.string :message

      t.timestamps
    end
  end
end
