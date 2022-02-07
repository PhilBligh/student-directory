@students = []

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when '3'
      save_students
    when '4'
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each { |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  }
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "What file would you like to save the list to?"
  filename = gets.chomp
  file = File.open(filename, 'w')
  @students.each {|student|
    student_date = [student[:name], student[:cohort]]
    csv_line = student_date.join(',')
    file.puts csv_line
  }
  file.close
  puts "The list of students has been saved to #{filename}"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r") do |file|
    file.readlines.each{|line|
      name, cohort = line.chomp.split(",")
      @students << {name: name, cohort: cohort.to_sym}
    }
  end
  puts "The list of students has been loaded from #{filename}"
end

def try_load_students
  filename = ARGV.first 
  return if filename.nil? 
  if File.exists?(filename) 
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist."
    exit 
  end
end

# this_file = File.basename("directory.rb")
# file = File.open(this_file, "r") do |file|
#   file.readlines.each{|line|
#     puts line
#   }
# end

  

try_load_students
interactive_menu