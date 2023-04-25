# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# create users
user1 = User.create(user_name: "John", email: "john@example.com", password: "password123")
user2 = User.create(user_name: "Jane", email: "jane@example.com", password: "password123")
# create cars
car1 = Car.create(name: "Toyota Camry", description: "Sedan car", photo: 'ff', price_per_day: 150, car_model: "Camry 2022", user_id: user1.id)
car2 = Car.create(name: "Honda Civic", description: "Compact car", photo: 'df', price_per_day: 120, car_model: "Civic 2022", user_id: user1.id)
car3 = Car.create(name: "Ford Mustang", description: "Sports car", photo: 'oop', price_per_day: 250, car_model: "Mustang GT 2022", user_id: user2.id)
# create reservations
reservation1 = Reservation.create(city: 'Accra', duration: 23, user_id: user1.id, car_id: car1.id, date: Date.today + 1)
reservation2 = Reservation.create(city: 'Kumasi', duration: 43, user_id: user1.id, car_id: car2.id, date: Date.today + 2)
reservation3 = Reservation.create(city: 'Tamale', duration: 65, user_id: user2.id, car_id: car3.id, date: Date.today + 5)