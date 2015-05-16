# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'faker'

3.times do
  user = User.new( name:     Faker::Name.name,
                   email:    Faker::Internet.email,
                   password: Faker::Lorem.characters(8) )
  user.skip_confirmation!
  user.save!
end

users = User.all

member = User.new( name:     'Member User',
                   email:    'member@example.com',
                   password: 'helloworld' )
member.skip_confirmation!
member.save!

# Create Topics
25.times do
  Topic.create!( user: users.sample,
                 title: Faker::English.word ) 
end

topics = Topic.all

topics.each do |topic|
  5.times do
    Bookmark.create!( topic:   topic,
                      user_id: topic.user_id,
                      url:     Faker::Internet.url )
  end
end

puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
