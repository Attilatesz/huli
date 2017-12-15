# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
  {email: "faklijta@gmail.com", provider: "github", uid: "29408150", github_handle: "faklijta", full_name: "Admin", access_token: nil, admin: true},
  {email: "attilanagy002@gmail.com", provider: "github", uid: "34302757", github_handle: "@alkyr81", full_name: "Applicant", access_token: nil, admin: false}
])
Applicant.create([
  {first_name: "Attila", last_name: "Nagy", email_address: "attilanagy002@gmail.com", phone_number: "304770314", highest_education: "College/BSc/BA", english_knowledge: "Advanced"},
  {first_name: "Cica", last_name: "Kiss", email_address: "cica@gmail.com", phone_number: "5555554", highest_education: "College/BSc/BA", english_knowledge: "Advanced"}
])

