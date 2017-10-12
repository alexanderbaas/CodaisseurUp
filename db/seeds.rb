Photo.delete_all
Theme.delete_all
Event.delete_all
Profile.delete_all
User.delete_all

miriam = User.create!(
  email: "email@email.com",
  password: "abcd1234",
)

photo1 = Photo.create(remote_image_url: "http://res.cloudinary.com/ajmbaas/image/upload/v1507801475/photo-1496120005468-ab3ddc9991dd_v3xleq.jpg")
photo2 = Photo.create(remote_image_url: "http://res.cloudinary.com/ajmbaas/image/upload/v1507801363/andrew-wulf-311064_oqahos.jpg")
photo3 = Photo.create(remote_image_url: "http://res.cloudinary.com/ajmbaas/image/upload/v1507799509/sample.jpg")

event = Event.create!(
  name: "Yoga Weekend",
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
  photos: [photo1, photo2, photo3],
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
event.themes << Theme.find_by(name: "Outdoors & Adventure")
event.themes << Theme.find_by(name: "Sports & Fitness")
