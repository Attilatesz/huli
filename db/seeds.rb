# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# To set yourself admin profile plese fill in the below template with your details and run rails db:seed

# To seed your database with below values please run rails db:seed

Option.create([
  {category: 'Language', name: 'English', message: 'Sure'},
  {category: 'Language', name: 'Hungarian', message: 'No, thanks'},
  {category: 'Payment', name: 'Prepayment-headhunting', message:'Prepayment with headhunting service (990 000 HUF + VAT)'},
  {category: 'Payment', name: 'Prepayment', message: 'Prepayment without headhunting service (1 290 000 HUF + VAT)'},
  {category: 'Payment', name: 'Post payment', message: 'Post-payment with headhunting service (1 290 000 HUF + VAT)'},
  {category: 'Education', name: 'Primary school'},
  {category: 'Education', name: 'Vocational secondary school'},
  {category: 'Education', name: 'Secondary school'},
  {category: 'Education', name: 'College/BSc/BA'},
  {category: 'Education', name: 'University/MSc/MA'},
  {category: 'Education', name: 'Doctoral'},
  {category: 'English_level', name: 'Beginner'},
  {category: 'English_level', name: 'Intermediate'},
  {category: 'English_level', name: 'Advanced'},
  {category: 'English_level', name: 'Native'}
])

User.create(
  email: "edesanna@hotmail.com", provider: "google_oauth2", uid: "123", access_token: 1,
  admin: false
  )

Applicant.create(
  first_name: "Edes", last_name: "Anna", email_address: "edesanna@hotmail.com",
  phone_number: "063055555555", highest_education: "College/BSc/BA", english_knowledge: "Advanced",
  english_class: "English", payment_option: "Prepayment_headhunting", user_id: User.last.id
)

User.create(
  email: "KKriszti@hotmail.com", provider: "google_oauth2", uid: "124", access_token: 2,
  admin: false
  )

Applicant.create(
  first_name: "Kiss", last_name: "Krisztina", email_address: "KKriszti@hotmail.com",
  phone_number: "06308888888", highest_education: "College/BSc/BA", english_knowledge: "Advanced",
  english_class: "English", payment_option: "Prepayment_headhunting", user_id: User.last.id
  )

User.create(
  email: "erosp@freemail.com", provider: "google_oauth2", uid: "125", access_token: 3,
  admin: false
  )

Applicant.create(
  first_name: "Eros", last_name: "Pista", email_address: "erosp@freemail.com",
  phone_number: "06307777777", highest_education: "College/BSc/BA", english_knowledge: "Advanced",
  english_class: "English", payment_option: "Prepayment_headhunting", user_id: User.last.id
)
