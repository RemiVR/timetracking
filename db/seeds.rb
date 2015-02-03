# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create name: "Sony", description: "its alright"
Project.create name: "Soso"
Project.create name: "apple", description: "not too bad"
Project.create name: "samsung", description: "okay"
Project.create name: "HP", description: "just okay"
Project.create name: "lenovo", description: "almost great"
Project.create name: "juice", description: "drinkable"
beer_project = Project.create name: "beer", description: "loved"

beer_project.entries.create hours: 3, minutes: 41, date: Date.today



