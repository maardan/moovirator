# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.create(
[{
   email: "maardan@gmail.com",
   rating: "5",
   comment: "Epic!!!",
   movie_title: "The Godfather",
   movie_id: "238",
   movie_img: "/rPdtLWNsZmAtoZl9PK7S2wE3qiS.jpg"
 },
{
   email: "marmar@gmail.com",
   rating: "3",
   comment: "These men were not so angry",
   movie_title: "12 Angry Men",
   movie_id: "389",
   movie_img: "/3W0v956XxSG5xgm7LB6qu8ExYJ2.jpg"
 },
 {
   email: "mmm@gmail.com",
   rating: "1",
   comment: "These Fellas were Bad!",
   movie_title: "GoodFellas",
   movie_id: "769",
   movie_img: "/hAPeXBdGDGmXRPj4OZZ0poH65Iu.jpg"
 },
 {
   email: "maardan@gmail.com",
   rating: "4",
   comment: "Great movie",
   movie_title: "Life Is Beautiful",
   movie_id: "637",
   movie_img: "/f7DImXDebOs148U4uPjI61iDvaK.jpg"
 }
])