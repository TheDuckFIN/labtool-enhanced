# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create username:"vlakanie", password:"lollero1", password_confirmation:"lollero1", admin:true, realname:"Valtteri Lakaniemi", irc_nick:"TheDuck", email:"valtteri.lakaniemi@gmail.com", student_number:"014614288"
user2 = User.create username:"mluukkai", password:"lollero1", password_confirmation:"lollero1", admin:false, realname:"Matti Luukkainen", irc_nick:"mluukkai", email:"mluukkai@cs.helsinki.fi", student_number:"012345678"
user3 = User.create username:"testikäyttäjä", password:"lollero1", password_confirmation:"lollero1", realname:"Testi", email:"testi@testi.com", student_number:"012345678"
user4 = User.create username:"jorma", password:"lollero1", password_confirmation:"lollero1", realname:"Testi", email:"testi@testi.com", student_number:"012345678"
user5 = User.create username:"asdfghj", password:"lollero1", password_confirmation:"lollero1", realname:"Testi", email:"testi@testi.com", student_number:"012345678"
user6 = User.create username:"jarkko", password:"lollero1", password_confirmation:"lollero1", realname:"Testi", email:"testi@testi.com", student_number:"012345678"
user7 = User.create username:"ViLLePeTtErI", password:"lollero1", password_confirmation:"lollero1", realname:"Testi", email:"testi@testi.com", student_number:"012345678"

course1 = Course.create leader:user2, name:"Javalabra IV/2016", description: "Tehdään javalla kivoja ohjelmia! JEEJEE", irc_channel:"#javalabra", active:true, registeration_open:true
course2 = Course.create leader:user3, name:"Tietokantasovellusten harkkatyö IV/2016", description: "Harjoitellaan SQL-kyselykielen käyttöä käytännössä sovelluksen toteutuksessa.", irc_channel:"#tsoha2016", active:true, registeration_open:false
course3 = Course.create leader:user2, name:"Javalabra III/2016", description: "Tehdään javalla kivoja ohjelmia! JEEJEE", irc_channel:"#javalabra", active:false, registeration_open:false

user4.participations.create course:course3
user3.participations.create course:course3
user5.participations.create course:course3
user6.participations.create course:course3
user1.participations.create course:course3, teacher: true

user1.participations.create course:course2
user5.participations.create course:course2
user7.participations.create course:course2