# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  { name: "Lars" },
  { name: "Stephen" }
].each do |attributes|
  User.where(attributes).first_or_create
end

[
  { name: "Best Picture", sort_order: 1 },
  { name: "Best Actor", sort_order: 2 }
].each do |attributes|
  Category.where(attributes).first_or_create
end

[
  { name: "La La Land", year: 2016 },
  { name: "Manchester By The Sea", year: 2016 }
].each do |attributes|
  Film.where(attributes).first_or_create
end

Film.all.each do |film|
  Category.order(:sort_order).first
    .nominations
    .where(nominee_id: film)
    .first_or_create(year: 2017)
end
