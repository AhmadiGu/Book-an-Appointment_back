# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

if Doorkeeper::Application.count.zero?
    Doorkeeper::Application.create!(name: 'Web Client', redirect_uri: '', scopes: '')
    Doorkeeper::Application.create!(name: 'iOS Client', redirect_uri: '', scopes: '')
    Doorkeeper::Application.create!(name: 'Android Client', redirect_uri: '', scopes: '')
    Doorkeeper::Application.create!(name: 'React', redirect_uri: '', scopes: '')
  end
  
   User.first_or_create(email: 'admin@example.com',
                       password: 'password',
                       password_confirmation: 'password', 
                       username: 'admin')
  
                       Car.create(name: "Toyota Camry", 
                                photo: "https://content-images.carmax.com/qeontfmijmzv/25NcA62ks4WtOMUJlvsW9x/77ace1ff19f51d1968a363b1515c4af6/acura.jpg" ,
                                description: "Sedan car",
                                price_per_day: 150, 
                                car_model: "Camry 2022", 
                                user_id: user1.id)
            
                       Car.create(name: "Honda Civic", 
                                photo: "https://images.clickdealer.co.uk/vehicles/4759/4759877/full/108663623.jpg" ,
                                description: "Compact car",
                                price_per_day: 120, 
                                car_model: "Civic 2022", 
                                user_id: user1.id)

                       Car.create(name: "Ford Mustang",
                                photo: "https://www.copart.com/content/hellcat.jpeg" , 
                                description: "Sports car",
                                price_per_day: 250, 
                                car_model: "Mustang GT 2022", 
                                user_id: user2.id)
            
  
  
  
  
  

