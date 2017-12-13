class CreateCvs < ActiveRecord::Migration[5.1]
  def change
    create_table :cvs do |t|
      t.string :cv_uid
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
