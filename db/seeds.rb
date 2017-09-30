#This file helps for testing and to bring all of the data over for a new instanc of an application.
# Github doesn't track the SQL database.
#set of data that we want to maintain for initialization.
# seeds is the code to test create the test database.

# otherwise you would need a big script of SQL or do it by hand.
require 'random_data'

# Create Users
5.times do
  User.create!(
    name:     RandomData.random_name,
    email:    RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all

# Create Topics
15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all

# Create Posts
50.times do
  Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

# Create Sponsored Posts
5.times do
  SponsoredPost.create!(
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = SponsoredPost.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

50.times do
  Advertisement.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    price: rand(50),
  )
end

Post.find_or_create_by(title: "FooZebra", body: "BarBarBarBarBarBarBarBarBarBarBarBar")

user = User.first
user.update_attributes!(
  email: 'youremail.com', # replace this with your personal email
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
