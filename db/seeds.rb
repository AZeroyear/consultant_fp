# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!({ name: "fp user", email: 'fpuser@fp.com', fp: true } )
TimeSetting.create!(
              [ {week: 0, interval: 30, start: "10:00", end: "18:00", workday: false },
                {week: 1, interval: 30, start: "10:00", end: "18:00", workday: true },
                {week: 2, interval: 30, start: "10:00", end: "18:00", workday: true },
                {week: 3, interval: 30, start: "10:00", end: "18:00", workday: true },
                {week: 4, interval: 30, start: "10:00", end: "18:00", workday: true },
                {week: 5, interval: 30, start: "10:00", end: "18:00", workday: true },
                {week: 6, interval: 30, start: "11:00", end: "15:00", workday: true }
              ])
