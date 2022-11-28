def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # creates an empty array
  students = []
  # get the first name
  name = gets.chomp 
  # while the name is NOT empty repeat this code
  while !name.empty? do
    students <<{name: name, cohort: :november} # for each name entered, creates a template for the hash
    puts "Now we have #{students.count} students"
    # get another name from user 
    name = gets.chomp
  end
  #returns the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "_____________"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)





