# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


guitar = Instrument.create(user_id: "3", category: "guitar", day_value: 100, brand: "Fender", description: "12 cordas, uhú!", condition: "nova")
drums = Instrument.create(user_id: "3", category: "drums", day_value: 100, brand: "Tama", description: "kit completo!", condition: "nova")
bass = Instrument.create(user_id: "3", category: "bass", day_value: 100, brand: "Fodera", description: "6 cordas", condition: "usada")
guitar = Instrument.create(user_id: "1", category: "guitar", day_value: 100, brand: "Fender", description: "12 cordas!", condition: "nova")
drums = Instrument.create(user_id: "2", category: "drums", day_value: 100, brand: "Pearl", description: "2 bumbos", condition: "usada")
bass = Instrument.create(user_id: "2", category: "bass", day_value: 100, brand: "Ibanez", description: "5 cordas", condition: "nova")


