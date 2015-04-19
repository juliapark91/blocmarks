# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'faker'

# Create Users
3.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(8)
    )
  user.skip_confirmation!
  user.save!
end

users = User.all

# Create Topics
5.times do
  Topic.create!(
    user: users.sample,
    title: Faker::Lorem.sentence
    )  
end

topics = Topic.all

# Create Bookmarks
5.times do
  Bookmark.create!(
    topic: topics.sample,
    url: Faker::Internet.url
    )
end

puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
