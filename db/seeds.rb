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
  User.create(
    email: Faker::Internet.unique.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
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
  coins: 100,
  role: 0
)

User.create(
  email: "alopez7@uc.cl",
  first_name: "Antonio",
  last_name: "Lopez",
  password: "123456",
  coins: 100,
  role: 0
)

User.create(
  email: "user@user.com",
  first_name: "Usuario",
  last_name: "Usuarin",
  password: "123456",
  coins: 50,
  role: 1
)

User.create(
  email: "gestor@gestor.com",
  first_name: "Gestor",
  last_name: "Gestorin",
  password: "123456",
  coins: 60,
  role: 2
)

# Create 10 teams
10.times do
  Team.create(
    name: Faker::RockBand.unique.name,
    description: Faker::Lorem.sentence
  )
end
=begin
user_ids = User.pluck(:id)
gestor_ids = User.where(role: 2).pluck(:id)
# Create 10 events
10.times do
  Event.create(
    event_type: Faker::Job.field,
    private: Faker::Boolean.boolean,
    date_start: Faker::Date.backward(5),
    date_end: Faker::Date.forward(20),
    user_id: gestor_ids.sample
  )
end
event_ids = Event.pluck(:id)
private_event_ids = Event.where(private: false).pluck(:id)
team_ids = Team.pluck(:id)

# Create 5 invitations
5.times do
  Invitation.create(
    user_id: user_ids.sample,
    event_id: private_event_ids.sample
  )
end

# Create 20 matches
20.times do
  Match.create(
    name: Faker::Lorem.word,
    state: 0,
    event_id: event_ids.sample,
    match_date: Faker::Date.forward(5),
    bet_date: Faker::Date.forward(10)
  )
end

match_ids = Match.pluck(:id)

# Create 10 aprticipations
10.times do
  Participation.create(
    placing: rand(0..10),
    match_id: match_ids.sample,
    team_id: team_ids.sample
  )
end

# Create 20 bets
20.times do
  Bet.create(
    ammount: rand(0..100),
    bet_state: rand(0..1),
    match_id: match_ids.sample,
    user_id: user_ids.sample,
    team_id: team_ids.sample
  )
end
=end
