
FactoryBot.define do
  factory :application_status do
    name "MyString"
  end
  factory :application_type do
    name "MyString"
  end
  factory :applied_job do
    user_id 1
    job_id 1
    job_title "MyString"
    company_name "MyString"
    application "MyText"
    application_type_id 1
    application_status_id 1
  end
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