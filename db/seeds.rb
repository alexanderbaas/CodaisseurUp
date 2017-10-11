#
#
# # Theme.destroy_all
# User.destroy_all
#
#
# meneer = User.create!({email: "email@email.com", password: "abcd12334" })
# kerel = User.create!({email: "emal@email.com", password: "abcd12334" })
# menneke = User.create!({email: "mail@email.com", password: "abcd12334" })
# gast = User.create!({email: "emai@email.com", password: "abcd12334" })
# knul = User.create!({email: "eail@email.com", password: "abcd12334" })
# guy = User.create!({email: "emdail@email.com", password: "abcd12334" })
#
# event1 = Event.create!({name: "Music4More",
#                      description: "Festival!!!",
#                      location: "Utreg!",
#                      price: 25.00,
#                      capacity: 5000,
#                      includes_food: true,
#                      includes_drinks: true,
#                      starts_at: DateTime.parse("10/12/2017 17:00"),
#                      ends_at: DateTime.parse("11/12/2017 01:00"),
#                      active: true,
#                      user: meneer})
Theme.delete_all
Event.delete_all
User.delete_all

miriam = User.create!(
  email: "miriam@codaisseurup.com",
  password: "abcd1234",
)

event = Event.create!(
  name: "Monthly Yoga Weekend",
  description: "Let's come together and practice some asanas together in the woods!",
  location: "Amsterdam",
  includes_food: false,
  includes_drinks: true,
  price: 10.00,
  starts_at: 10.days.from_now,
  ends_at: 12.days.from_now,
  capacity: 100,
  active: true,
  user: miriam,
)

Theme.create!([
  { name: "Movements" },
  { name: "Outdoors & Adventure" },
  { name: "Tech" },
  { name: "Family" },
  { name: "Health & Wellness" },
  { name: "Sports & Fitness" },
  { name: "Learning" },
  { name: "Photography" },
  { name: "Food & Drink" },
])

event = Event.find_by(name: "Monthly Yoga Weekend")
event.Themes << Theme.find_by(name: "Outdoors & Adventure")
event.Themes << Theme.find_by(name: "Sports & Fitness")
