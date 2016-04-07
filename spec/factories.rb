FactoryGirl.define do
  factory :user do
    username 'vlakanie'
    password 'lollero1'
    password_confirmation 'lollero1'
    student_number '012345678'
    email 'asd@asd.com'
    admin true
  end

  factory :course do
    name 'tsoha'
    description 'asd'
    active true
    registeration_open true
  end
end