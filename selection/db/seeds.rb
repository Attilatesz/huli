# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
  {email: "faklijta@gmail.com", provider: "google_oauth2", full_name: "Admin", access_token: nil, 
  admin: true},
  {email: "edesanna@hotmail.com", provider: "google_oauth2", full_name: "Édes Anna", access_token: nil, 
  admin: false},
  {email: "KKriszti@hotmail.com", provider: "google_oauth2", full_name: "Kiss Krisztina", access_token: nil, 
  admin: false},
  {email: "erosp@freemail.com", provider: "google_oauth2", full_name: "Erős Pista", access_token: nil, 
  admin: false}
])
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
  {category: 'English level', name: 'Beginner'},
  {category: 'English level', name: 'Intermediate'},
  {category: 'English level', name: 'Advanced'},
  {category: 'English level', name: 'Native'}
])

Applicant.create([
  {first_name: "Edes", last_name: "Anna", email_address: "edesanna@hotmail.com", 
  phone_number: "063055555555", highest_education: "College/BSc/BA", english_knowledge: "Advanced", 
  english_class: "English", payment_option: "Prepayment_headhunting"},
  {first_name: "Kiss", last_name: "Krisztina", email_address: "KKriszti@hotmail.com", 
  phone_number: "06308888888", highest_education: "College/BSc/BA", english_knowledge: "Advanced", 
  english_class: "English", payment_option: "Prepayment_headhunting"},
  {first_name: "Eros", last_name: "Pista", email_address: "erosp@freemail.com", 
  phone_number: "06307777777", highest_education: "College/BSc/BA", english_knowledge: "Advanced", 
  english_class: "English", payment_option: "Prepayment_headhunting"}
])
