class CreateDrts < ActiveRecord::Migration[5.1]
  def change
    create_table :drts do |t|
      t.string :drt_hash, null: false, unique: true
      t.references :applicant
      t.float :result_percentage
      t.string :result_pdf_uid
      t.string :status

      t.timestamps
    end
  end
end
