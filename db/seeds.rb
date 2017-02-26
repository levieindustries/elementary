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

# [
#   { name: "Best Picture", sort_order: 1 },
#   { name: "Best Actor", sort_order: 2 }
# ].each do |attributes|
#   Category.where(attributes).first_or_create
# end
#
# [
#   { name: "La La Land", year: 2016 },
#   { name: "Manchester By The Sea", year: 2016 }
# ].each do |attributes|
#   Film.where(attributes).first_or_create
# end
#
# Film.all.each do |film|
#   Category.order(:sort_order).first
#     .nominations
#     .where(nominee_id: film)
#     .first_or_create(year: 2017)
# end

nominations_by_category = [
  {
    category: "Best Picture",
    sort_order: 1,
    nominees: [
      { name: "Arrival", description: "" },
      { name: "Fences", description: "" },
      { name: "Hacksaw Ridge", description: "" },
      { name: "Hell or High Water", description: "" },
      { name: "Hidden Figures", description: "" },
      { name: "La La Land", description: "" },
      { name: "Lion", description: "" },
      { name: "Manchester By the Sea", description: "" },
      { name: "Moonlight", description: "" }
    ]
  },
  {
    category: "Best Actor",
    sort_order: 2,
    nominees: [
      { name: "Casey Affleck", description: "Manchester By the Sea" },
      { name: "Andrew Garfield", description: "Hacksaw Ridge" },
      { name: "Ryan Gosling", description: "La La Land" },
      { name: "Viggo Mortensen", description: "Captain Fantastic" },
      { name: "Denzel Washington", description: "Fences" }
    ]
  },
  {
    category: "Best Supporting Actor",
    sort_order: 3,
    nominees: [
      { name: "Mahershala Ali", description: "Moonlight" },
      { name: "Jeff Bridges", description: "Hell or High Water" },
      { name: "Lucas Hedges", description: "Manchester by the Sea" },
      { name: "Dev Patel", description: "Lion" },
      { name: "Michael Shannon", description: "Nocturnal Animals" }
    ]
  },
  {
    category: "Best Actress",
    sort_order: 4,
    nominees: [
      { name: "Isabelle Huppert", description: "Elle" },
      { name: "Ruth Negga", description: "Loving" },
      { name: "Emma Stone", description: "La La Land" },
      { name: "Natalie Portman", description: "Jackie" },
      { name: "Meryl Streep", description: "Florence Foster Jenkins" }
    ]
  },
  {
    category: "Best Supporting Actress",
    sort_order: 5,
    nominees: [
      { name: "Viola Davis", description: "Fences" },
      { name: "Naomie Harris", description: "Moonlight" },
      { name: "Nicole Kidman", description: "Lion" },
      { name: "Octavia Spencer", description: "Hidden Figures" },
      { name: "Michelle Williams", description: "Manchester by the Sea" }
    ]
  },
  {
    category: "Best Documentary Feature",
    sort_order: 6,
    nominees: [
      { name: "Fire at Sea" },
      { name: "I Am Not Your Negro" },
      { name: "Life, Animated" },
      { name: "O.J.: Made in America" },
      { name: "13th" }
    ]
  },
  {
    category: "Best Cinematography",
    sort_order: 7,
    nominees: [
      { name: "Bradford Young", description: "Arrival" },
      { name: "Linus Sandgren", description: "La La Land" },
      { name: "Grieg Fraser", description: "Lion, Grieg Fraser" },
      { name: "James Laxton", description: "Moonlight" },
      { name: "Rodrigo Prieto", description: "Silence" }
    ]
  },
  {
    category: "Best Foreign Language Film",
    sort_order: 8,
    nominees: [
      { name: "Land of Mine", description: "Denmark, Martin Zandvliet, director" },
      { name: "A Man Called Ove", description: "Sweden, Hannes Holm, director" },
      { name: "The Salesman", description: "Iran, Asghar Farhadi, director" },
      { name: "Tanna", description: "Australia, Bentley Dean, Martin Butler, directors" },
      { name: "Toni Erdmann", description: "Germany, Maren Ade, director" },
    ]
  },
  {
    category: "Best Costume Design",
    sort_order: 9,
    nominees: [
      { name: "Allied", description: "Joanna Johnston" },
      { name: "Fantastic Beasts and Where to Find Them", description: "Colleen Atwood" },
      { name: "Florence Foster Jenkins", description: "Consolata Boyle" },
      { name: "Jackie", description: "adeline Fontaine" },
      { name: "La La Land", description: "Mary Zophres" }
    ]
  },
  {
    category: "Best Original Score",
    sort_order: 10,
    nominees: [
      { name: "Jackie", description: "Micachu" },
      { name: "La La Land", description: "Justin Hurwitz" },
      { name: "Lion", description: "Dustin O’Halloran, Hauschka" },
      { name: "Moonlight", description: "Nicholas Britell" },
      { name: "Passengers", description: "Thomas Newman" },
    ]
  },
  {
    category: "Best Original Song",
    sort_order: 11,
    nominees: [
      { name: "Audition", description: "La La Land" },
      { name: "Can’t Stop the Feeling!", description: "Trolls" },
      { name: "City of Stars", description: "La La Land" },
      { name: "The Empty Chair", description: "Jim: The James Foley Story" },
      { name: "How Far I’ll Go", description: "Moana" }
    ]
  },
  {
    category: "Best Sound Editing",
    sort_order: 12,
    nominees: [
      { name: "Arrival" },
      { name: "Deepwater Horizon" },
      { name: "Hacksaw Ridge" },
      { name: "La La Land" },
      { name: "Sully" }
    ]
  },
  {
    category: "Best Sound Mixing",
    sort_order: 13,
    nominees: [
      { name: "Arrival" },
      { name: "Hacksaw Ridge" },
      { name: "La La Land" },
      { name: "Rogue One: A Star Wars Story" },
      { name: "13 Hours" }
    ]
  },
  {
    category: "Best Documentary Short",
    sort_order: 14,
    nominees: [
      { name: "4.1 Miles", description: "University of California, Berkeley" },
      { name: "Extremis", description: "f/8 Filmworks in association with Motto Pictures" },
      { name: "Joe's Violin", description: "Lucky Two Productions" },
      { name: "Watani: My Homeland", description: "ITN Productions" },
      { name: "The White Helmets", description: "Grain Media and Violet Films" }
    ]
  },
  {
    category: "Best Production Design",
    sort_order: 15,
    nominees: [
      { name: "Patrice Vermette", description: "Arrival" },
      { name: "Stuart Craig", description: "Fantastic Beasts and Where to Find Them" },
      { name: "Various", description: "Hail, Caesar!" },
      { name: "Sandy Reynolds-Wasco and David Wasco", description: "La La Land" },
      { name: "Guy Hendrix Dyas", description: "Passengers" }
    ]
  },
  {
    category: "Best Original Screenplay",
    sort_order: 16,
    nominees: [
      { name: "Taylor Sheridan", description: "Hell or High Water" },
      { name: "Damien Chazelle", description: "La La Land" },
      { name: "Yorgos Lanthimos and Efthymis Filippou", description: "The Lobster" },
      { name: "Kenneth Lonergan", description: "Manchester by the Sea" },
      { name: "Mike Mills", description: "20th Century Women" }
    ]
  },
  {
    category: "Best Adapted Screenplay",
    sort_order: 17,
    nominees: [
      { name: "Eric Heisserer", description: "Arrival" },
      { name: "August Wilson", description: "Fences" },
      { name: "Allison Schroeder and Theodore Melfi", description: "Hidden Figures" },
      { name: "Luke Davies", description: "Lion" },
      { name: "Barry Jenkins and Tarell Alvin McRaney", description: "Moonlight" },
    ]
  },
  {
    category: "Best Animated Feature",
    sort_order: 18,
    nominees: [
      { name: "Kubo and the Two Strings" },
      { name: "Moana" },
      { name: "My Life As a Zucchini" },
      { name: "The Red Turtle " },
      { name: "Zootopia" }
    ]
  },
  {
    category: "Best Animated Short",
    sort_order: 19,
    nominees: [
      { name: "Blind Vaysha", description: "National Film Board of Canada" },
      { name: "Borrowed Time", description: "Quorum Films" },
      { name: "Pear Cider and Cigarettes", description: "Massive Swerve Studios and Passion Pictures Animation" },
      { name: "Pearl", description: "Google Spotlight Stories/Evil Eye Pictures" },
      { name: "Piper", description: "Pixar" }
    ]
  },
  {
    category: "Best Film Editing",
    sort_order: 20,
    nominees: [
      { name: "Joe Walker", description: "Arrival" },
      { name: "John Gilbert", description: "Hacksaw Ridge" },
      { name: "Jake Roberts", description: "Hell or High Water" },
      { name: "Tom Cross", description: "La La Land" },
      { name: "Joi McMillon and Nat Sanders", description: "Moonlight" }
    ]
  },
  {
    category: "Best Visual Effects",
    sort_order: 21,
    nominees: [
      { name: "Deepwater Horizon" },
      { name: "Doctor Strange" },
      { name: "The Jungle Book" },
      { name: "Kubo and the Two Strings" },
      { name: "Rogue One: A Star Wars Story" }
    ]
  },
  {
    category: "Best Makeup and Hairstyling",
    sort_order: 22,
    nominees: [
      { name: "A Man Called Ove" },
      { name: "Star Trek Beyond" },
      { name: "Suicide Squad" }
    ]
  },
  {
    category: "Best Director",
    sort_order: 23,
    nominees: [
      { name: "Arrival", description: "Denis Villeneuve" },
      { name: "Hacksaw Ridge", description: "Mel Gibson" },
      { name: "La La Land", description: "Damien Chazelle" },
      { name: "Manchester By The Sea", description: "Kenneth Lonergan" },
      { name: "Moonlight", description: "Barry Jenkins" },
    ]
  },
  {
    category: "Best Live Short",
    sort_order: 24,
    nominees: [
      { name: "Ennemis Intérieurs", description: "Sélim Azzazi" },
      { name: "La Femme et le TGV", description: "Timo von Gunten and Giacun Caduff" },
      { name: "Silent Nights", description: "Aske Bang and Kim Magnusson" },
      { name: "Sing", description: "Kristof Deák and Anna Udvardy" },
      { name: "Timecode", description: "Juanjo Giménez" }
    ]
  }
]

nominations_by_category.each do |c_attrs|
  category = Category
    .where(name: c_attrs[:category])
    .first_or_create!(sort_order: c_attrs[:sort_order])

  c_attrs[:nominees].each do |n_attrs|
    film = Film
      .where(name: n_attrs[:name])
      .first_or_create!(year: 2016, description: n_attrs[:description])

    category.nominations.where(nominee_id: film).first_or_create!(year: 2017)
  end
end
