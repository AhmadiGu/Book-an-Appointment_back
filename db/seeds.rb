# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# create users
user1 = User.create(username: "John", email: "john@example.com", password: "jkkjkjkjkjkj")
user2 = User.create(username: "Jane", email: "jane@example.com", password: "jkkiiijkjkj")
# create cars
car1 = Car.create(name: "Toyota Camry", photo: "https://content-images.carmax.com/qeontfmijmzv/25NcA62ks4WtOMUJlvsW9x/77ace1ff19f51d1968a363b1515c4af6/acura.jpg" , description: "Sedan car", price_per_day: 150, car_model: "Camry 2022", user_id: user1.id)
car2 = Car.create(name: "Honda Civic", photo: "https://images.clickdealer.co.uk/vehicles/4759/4759877/full/108663623.jpg" , description: "Compact car", price_per_day: 120, car_model: "Civic 2022", user_id: user1.id)
car3 = Car.create(name: "Ford Mustang",photo: "https://www.copart.com/content/hellcat.jpeg" , description: "Sports car", price_per_day: 250, car_model: "Mustang GT 2022", user_id: user2.id)
# create reservations
reservation1 = Reservation.create(user_id: user1.id, car_id: car1.id, date: Date.today + 1, city: "London", duration: 22, item: car1.name)
reservation2 = Reservation.create(user_id: user1.id, car_id: car2.id, date: Date.today + 2, city: "London", duration: 33, item: car2.name)
reservation3 = Reservation.create(user_id: user2.id, car_id: car3.id, date: Date.today + 5, city: "London", duration: 23, item: car3.name)

