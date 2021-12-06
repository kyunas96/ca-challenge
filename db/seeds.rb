# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

course_release_date = DateTime.new(2022, 1, 1, 12, 0)

Course.create(
  name: "Ruby 2.0", 
  release_date: course_release_date, 
  created_at: DateTime.now, 
  updated_at: DateTime.now)