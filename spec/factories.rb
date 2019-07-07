
FactoryBot.define do
  factory :user_standart_application, class: 'User::StandartApplication' do
    user_id 1
    application "MyText"
  end
  factory :user do 
    first_name 'john'
    last_name 'doe'
    email 'johndoe@example.com'
    password 'diller'
    password_confirmation 'diller'
  end

  factory :contact do
    user_id 1
    name "soren hald"
    position "job cunsultant"
    email "sh@example.com"
    phone "88888888"
  end

end