def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
    name = gets.chomp
    students = []
    while !name.empty? do
      puts "Please enter the hobby of the student"
      hobby = gets.chomp 
      puts "Please enter the student's country of birth"
      country = gets.chomp 
      puts "Please enter the height of the student"
      height = gets.chomp 
      students <<{name: name, hobbies: hobby, country_of_birth: country, height: height, cohort: :november} # for each name entered, creates a template for the hash
      puts "Now we have #{students.count} students"
      puts "Please enter the name of the student"
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
  print_count = 1
  while print_count <= 1 do
    print_count += 1
    students.each.with_index(1) do |student, i|
      puts "#{i}. #{student[:name]}, Hobby: #{student[:hobbies]}, Country of Birth: #{student[:country_of_birth]}, Height: #{student[:height]}, (#{student[:cohort]} cohort)"
      # puts "#{i}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
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