require 'securerandom'

5.times do
  user = User.create({name: Faker::Name.name , longitude: Faker::Number.number,latetude: Faker::Number.number,uuid: SecureRandom.uuid})
  user.posts.create({title: Faker::Book.title, body: Faker::Lorem.sentence})
end
