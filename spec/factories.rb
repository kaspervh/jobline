
FactoryBot.define do

  factory :user do 
    first_name 'john'
    last_name 'doe'
    email 'johndoe@example.com'
    password 'diller'
    password_confirmation 'diller'
  end

end