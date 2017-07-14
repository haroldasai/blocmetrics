# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.all

#if ENV["list"]
  users.each do |user|
	5.times do
	  app_name = Faker::App.name	
	  RegisteredApplication.create!(
		name:  app_name,
	   	user:  user,
	   	url:   Faker::Internet.url(app_name, '/index.html') 
	  )
	end
  end

applications = RegisteredApplication.all

  applications.each do |application|
    5.times do
      Event.create!(
      	name: Faker::Hacker.ingverb,
      	registered_application: application
      )
    end
  end    	

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} lists created"
puts "#{Event.count} items created"
