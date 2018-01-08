class CreateApplicants < ActiveRecord::Migration[5.1]
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :phone_number
      t.string :highest_education
      t.string :english_knowledge
      t.string :english_class
      t.string :payment_option

      t.timestamps
    end
  end
end
