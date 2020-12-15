# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserJudicial.destroy_all
User.destroy_all
Party.destroy_all
Judicial.destroy_all
Step.destroy_all

user = User.create(
  email: 'admin@admin.com',
  first_name: 'Admin',
  last_name: 'Admin',
  password: "123456",
  password_confirmation: "123456"
)
# file = URI.open(Faker::Avatar.image)
# user.photo.attach(io: file, filename: "#{user.username}.png", content_type: 'image/png')

response = Net::HTTP.get(URI("https://randomuser.me/api/?results=20&nat=BR"))

datas = JSON.parse(response)
datas["results"].each_with_index do |data, index|
  user = User.create(
    email: data["email"],
    first_name: data["name"]["first"].capitalize,
    last_name: data["name"]["last"].capitalize,
    password: "123456",
    password_confirmation: "123456"
  )
  # file = URI.open(data["picture"]["large"])
  # user.photo.attach(io: file, filename: "#{user.username}.png", content_type: 'image/png')
  puts "#{index} Users have been created" if index % 5 == 0
end

puts "All user created!"

## Populating Steps table #################################################################
require 'csv'

file = "app/assets/csv/steps-v2.csv"

csv_options = {
  col_sep: ';',
  quote_char: '"',
  headers: :first_row
}

CSV.foreach(file, csv_options) do |row|
  Step.create(
    cnj_number: row[0],
    description: row[1],
    priority: row[2],
    translation: row[3],
    stage: row[4]
  )
end

######### Importing judicials ############################################
require "json"
file = File.read("app/assets/judicials/processo_teste_2.json")

data = JSON.parse(file)
judicials = data["judicials"]

judicials.each do |jud|
  new_judicial = Judicial.create!(
    number: jud["processo"],
    judicial_type: jud["classe"]
  )

  jud["partes"].each do |key, value|
    value.each do |name|
      Party.create!(
        role: key,
        name: name,
        judicial_id: new_judicial.id
      )
    end
  end

  jud["andamento"].each do |step|
    JudicialStep.create!(
      step_id: Step.where("cnj_number": step[0])[0].id,
      date: Date.parse(step[1]),
      judicial_id: new_judicial.id,
      complement: step[2],
      decision: (step[3] unless step[3] == "0")

    )
  end
end
