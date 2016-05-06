require 'factory_girl_rails'

def population_to_courses(n, c1, c2)
  n.times do
    user = FactoryGirl.create :user
    FactoryGirl.create :participation, user:user, course:c1
    FactoryGirl.create :participation, user:user, course:c2
  end
end

def new_course(admin, name, active=true)
  course = FactoryGirl.create :course, name:name, leader:admin, active:active, registeration_open:active
  course.current_week = FactoryGirl.create :current_week, course:course
  course.save

  (1..6).each do |i|
    FactoryGirl.create :week, course:course, number:i
  end

  course
end


admin = FactoryGirl.create :admin, username:'vlakanie'
FactoryGirl.create :user, username:'mluukkai'

c1 = new_course admin, 'Tsoha II/2016'
c2 = new_course admin, 'Javalabra alkukesä', false
c3 = new_course admin, 'Javalabra loppukesä'

population_to_courses 5, c1, c2
population_to_courses 5, c2, c3
population_to_courses 5, c1, c3

