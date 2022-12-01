# SAFETY
# def input_students
#   puts "Please enter the name of the student"
#   puts "To finish, just hit return twice"
#     name = gets.chomp
#     students = []
#     while !name.empty? do
#       puts "Please enter the hobby of the student"
#       hobby = gets.chomp 
#       puts "Please enter the student's country of birth"
#       country = gets.chomp 
#       puts "Please enter the height of the student"
#       height = gets.chomp 
#       students <<{name: name, hobbies: hobby, country_of_birth: country, height: height, cohort: :november} # for each name entered, creates a template for the hash
#       puts "Now we have #{students.count} students"
#       puts "Please enter the name of the student"
#       # get another name from user 
#       name = gets.chomp
#     end
#     #returns the array of students
#     students
#   end
# SAFETY




def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
    name = gets.chomp.capitalize
    students = []
    cohort_months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    while !name.empty? do
      puts "Please enter cohort"
      cohort = gets.chomp.capitalize
      puts "Please enter the hobby of the student"
      hobby = gets.chomp 
      puts "Please enter the student's country of birth"
      country = gets.chomp 
      puts "Please enter the height of the student"
      height = gets.chomp 
      if !cohort_months.include?(cohort) then cohort = "Unknown"
      end
      students <<{name: name, hobbies: hobby, country_of_birth: country, height: height, cohort: cohort.to_sym} # for each name entered, creates a template for the hash
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
    cohorts = students.map { |p| p[:cohort] }.uniq
    #maps the "students" array - each element a hash -, designates each hash 'p', 
    #takes each hash and calls the value of the cohort key 
    # .uniqs them so there aren't doubles and puts them in an array called "cohorts". So an order is set.
    cohorts.each do |x|
      # goes through the new array "cohorts" and designates each month as X  
    temp_students = students.select { |p| p[:cohort] == x}
    # creates a new array "temp_students" then selects to go in it from 
    #the "students" array the hashes where cohort equals eg november, december then jan as per order from .uniq
    temp_students.each do |student|
      #temp_students is now an array filled with elements that are hashes 
      #in order of month. this designates each hash as "student" 
    puts "#{student[:name]}".ljust(20) + "Hobby: #{student[:hobbies]}".ljust(25) + "Country of Birth: #{student[:country_of_birth]}".ljust(35) + "Height: #{student[:height]}".ljust(25) + "(#{student[:cohort]} cohort)".ljust(20)
  #then says print each "student" with these keys in a nice string.
  end  
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