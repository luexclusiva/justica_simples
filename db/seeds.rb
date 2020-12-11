# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
#
# user = User.create(
#   email: 'admin@admin.com',
#   first_name: 'Admin',
#   last_name: 'Admin',
#   password: "123456",
#   password_confirmation: "123456"
# )
# # file = URI.open(Faker::Avatar.image)
# # user.photo.attach(io: file, filename: "#{user.username}.png", content_type: 'image/png')
#
# response = Net::HTTP.get(URI("https://randomuser.me/api/?results=20&nat=BR"))
#
# datas = JSON.parse(response)
# datas["results"].each_with_index do |data, index|
#   user = User.create(
#     email: data["email"],
#     first_name: data["name"]["first"].capitalize,
#     last_name: data["name"]["last"].capitalize,
#     password: "123456",
#     password_confirmation: "123456"
#   )
#   # file = URI.open(data["picture"]["large"])
#   # user.photo.attach(io: file, filename: "#{user.username}.png", content_type: 'image/png')
#   puts "#{index} Users have been created" if index % 5 == 0
# end
#
# puts "All user created!"
#
# ## Populating Steps table #################################################################
# require 'csv'
#
# file = "app/assets/csv/movimentos-jec.csv"
#
# csv_options = {
#   col_sep: ',',
#   quote_char: '"',
#   headers: :first_row
# }
#
#
# CSV.foreach(file, csv_options) do |row|
#   Step.create(
#     cnj_number: row[0],
#     integer: row[3],
#     description: row[1],
#     translation: row[2]
#   )
# end

######### Testing with one judicial ############################################
require "json"
file = File.read("app/assets/judicials/processo_teste_2.json")


judicial = JSON.parse(file)



new_judicial = Judicial.create(
  number: judicial["processo"],
  judicial_type: judicial["classe"]
)

Party.create(
  role: "autor",
  name: judicial["partes"]["autor"],
  judicial_id: new_judicial.id
)

Party.create(
 role: "reu",
 name: judicial["partes"]["reu"],
 judicial_id: new_judicial.id
)


judicial["andamento"].each do |row|
  jd = JudicialStep.create!(
    step_id: Step.where("cnj_number":row[0])[0].id,
    date: Date.parse(row[1]),
    judicial_id: new_judicial.id,
  )
end
