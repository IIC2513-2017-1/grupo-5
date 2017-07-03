# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Clean database
Bet.destroy_all
Invitation.destroy_all
Participation.destroy_all
Match.destroy_all
Event.destroy_all
Team.destroy_all
User.destroy_all


# Create 20 users
20.times do
  @name = Faker::TwinPeaks.character.split
  User.create(
    email: Faker::Internet.unique.email,
    first_name: @name[0],
    last_name: @name[1],
    password: Faker::Internet.password,
    coins: rand(0..100),
    role: rand(0..2)
  )
end

User.create(
  email: "pfnieto@uc.cl",
  first_name: "Pablo",
  last_name: "Nieto",
  password: "123456",
  coins: 150,
  role: 0
)

User.create(
  email: "alopez7@uc.cl",
  first_name: "Antonio",
  last_name: "Lopez",
  password: "123456",
  coins: 250,
  role: 2
)

# Create 10 teams
Team.create(
  name: "Chile",
  description: Faker::TwinPeaks.quote
)

Team.create(
  name: "Alemania",
  description: Faker::TwinPeaks.quote
)

Team.create(
  name: "Mexico",
  description: Faker::TwinPeaks.quote
)

Team.create(
  name: "Portugal",
  description: Faker::TwinPeaks.quote
)

Team.create(
  name: "Argentina",
  description: Faker::TwinPeaks.quote
)

Event.create(
  event_type: "Copa Confederaciones",
  private: false,
  date_start: Date.parse("Jun 17 2017"),
  date_end: Date.parse("Jul 2 2017"),
  user_id: 20
)

14.times do
  Event.create(
    event_type: Faker::TwinPeaks.location,
    private: [true,false].sample,
    date_start: Date.parse("Mar 3 2017"),
    date_end: Faker::Date.between(20.days.ago, Date.today),
    user_id: rand(1..20)
  )
end

Match.create(
  name: "Chile vs Alemania",
  state: 1,
  event_id: 1,
  match_date: Date.parse("Jul 2 2017"),
  bet_date: Date.parse("Jul 1 2017")
)

Match.create(
  name: "Chile vs Portugal",
  state: 1,
  event_id: 1,
  match_date: Date.parse("Jun 29 2017"),
  bet_date: Date.parse("Jun 28 2017")
)

Match.create(
  name: "Alemania vs Mexico",
  state: 1,
  event_id: 1,
  match_date: Date.parse("Jun 28 2017"),
  bet_date: Date.parse("Jun 28 2017")
)

Participation.create(
  placing: 1,
  match_id: 1,
  team_id: 2
)

Participation.create(
  placing: 2,
  match_id: 1,
  team_id: 1
)

Participation.create(
  placing: 1,
  match_id: 2,
  team_id: 1
)

Participation.create(
  placing: 2,
  match_id: 2,
  team_id: 4
)

Participation.create(
  placing: 1,
  match_id: 3,
  team_id: 2
)

Participation.create(
  placing: 2,
  match_id: 3,
  team_id: 3
)

Bet.create(
  ammount: 75,
  bet_state: 1,
  match_id: 1,
  user_id: 22,
  team_id: 2
)

Bet.create(
  ammount: 25,
  bet_state: 1,
  match_id: 1,
  user_id: 21,
  team_id: 1
)

Follow.create(
  follower_id: 1,
  followed_id: 22
)

Follow.create(
  follower_id: 22,
  followed_id: 1
)

Follow.create(
  follower_id: 21,
  followed_id: 22
)
