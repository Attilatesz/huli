class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.references :applicant, foreign_key: true
      t.string :interviewer
      t.timestamp :start
      t.string :status

      t.timestamps
    end
  end
end
