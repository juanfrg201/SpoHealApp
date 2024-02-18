# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Route.create(level: 0, presure: 0, description: "Una ruta en donde el nivel de ejercicios he intensidad es bajo , y el nivel de presion es bajo")
Route.create(level: 0, presure: 1, description: "Una ruta en donde el nivel de ejercicios he intensidad es bajo , y el nivel de presion es medio")
Route.create(level: 0, presure: 2, description: "Una ruta en donde el nivel de ejercicios he intensidad es bajo , y el nivel de presion es alto")
Route.create(level: 1, presure: 0, description: "Una ruta en donde el nivel de ejercicios he intensidad es medio , y el nivel de presion es bajo")
Route.create(level: 1, presure: 1, description: "Una ruta en donde el nivel de ejercicios he intensidad es medio , y el nivel de presion es medio")
Route.create(level: 1, presure: 2, description: "Una ruta en donde el nivel de ejercicios he intensidad es medio , y el nivel de presion es alto")
Route.create(level: 2, presure: 0, description: "Una ruta en donde el nivel de ejercicios he intensidad es alto , y el nivel de presion es bajo")
Route.create(level: 2, presure: 1, description: "Una ruta en donde el nivel de ejercicios he intensidad es alto , y el nivel de presion es medio")
Route.create(level: 2, presure: 2, description: "Una ruta en donde el nivel de ejercicios he intensidad es alto , y el nivel de presion es alto")


