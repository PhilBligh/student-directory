puts "The students of Villains Academy"
puts "-------------"
students = [
 "Dr. Hannibal Lector",
 "Darth Vader",
 "Nurse Ratched",
 "Michael Corleone",
 "Alex DeLarge",
 "The Wicked Witch of the West",
 "Terminator",
 "Freddy Kruger",
 "The Joker",
 "Joffrey Baratheon",
 "Norman Bates"
]

students.each { |student|
  puts student
  }

puts "Overall, we have #{students.count} great students"