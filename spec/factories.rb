FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "User#{n}" }
    password 'lollero1'
    password_confirmation 'lollero1'
    student_number '012345678'
    email 'asd@asd.com'

    factory :admin, aliases: [:leader] do
      admin true
    end
  end

  factory :course do
    leader
    sequence(:name) { |n| "Course#{n}" }
    description 'asd'
    active true
    registeration_open true
    week_count 2
    current_week
    default_codereview_group
  end

  factory :codereview_group, aliases: [:default_codereview_group] do
    name 'Default'
  end

  factory :week, aliases: [:current_week] do
    number 0
    max_points 0
    code_review false
  end
end