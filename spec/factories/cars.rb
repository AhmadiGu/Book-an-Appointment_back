# New Factory for car
FactoryBot.define do
  factory :car do
    name { 'Toyota Camry' }
    description { 'Sedan car' }
    photo { 'https://content-images.carmax.com/qeontfmijmzv/25NcA62ks4WtOMUJlvsW9x/77ace1ff19f51d1968a363b1515c4af6/acura.jpg' }
    price_per_day { 120 }
    car_model { 'Camry 2022' }
    user_id { 1 }
  end
end
