# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = %w(Frozen Inception Batman)
years = %w(2013 2010 1989)

movies.each_with_index do |movie, index|
  Movie.create!(title: movie, year: years[index])
end
