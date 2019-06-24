# require 'faker'

start = Time.now

Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

def seed_data
  # create_users
  create_admin('admin@admin.com', 'adminadmin')
end

def create_users
  30.times do |i|
    user_name = 'user' + i.to_s
    email = "#{user_name}@gmail.com"
    create_user(email, 'testtest')
  end
end

def create_user(email, password)
  user = User.create(
      email: email,
      password: password,
      password_confirmation: password
    )
  puts "User with email #{ user.email } was created"
end

def create_admin(email, password)
  admin = Admin.create!(
      email: email,
      password: password,
      password_confirmation: password
    )
  puts "Admin with email #{ admin.email } was created"
end

def random_user_id
  User.all.reject { |user| user.admin == true }.sample.id
end

seed_data

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
