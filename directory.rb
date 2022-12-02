@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
   when "2"
      show_students
   when "3"
    save_students
   when "4"
    load_students
   when "9"
      exit
   else
      puts "I don't know what you mean, try again."
  end
end


def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
    name = STDIN.gets.delete("\n")   #.chomp.capitalize
    cohort_months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    while !name.empty? do
      puts "Please enter cohort"
      cohort = STDIN.gets.chomp.capitalize
      # puts "Please enter the hobby of the student"
      # hobby = gets.chomp 
      # puts "Please enter the student's country of birth"
      # country = gets.chomp 
      # puts "Please enter the height of the student"
      # height = gets.chomp 
      if !cohort_months.include?(cohort) then cohort = "Unknown"
      end
      @students <<{name: name, cohort: cohort.to_sym} 
      #@students <<{name: name, hobbies: hobby, country_of_birth: country, height: height, cohort: cohort.to_sym} 
      @students.count > 1 ? (puts "Now we have #{@students.count} students") : (puts "Now we have #{@students.count} student")
      # puts "Now we have #{students.count} students"
      puts "Please enter the name of the student"
      # get another name from user 
      name = STDIN.gets.chomp
    end
    #returns the array of students
    # students #think this can go
  end


  def show_students
    print_header
    print_students_list
    print_footer
  end
  
  def print_header
    puts "The students of Villains Academy"
    puts "_____________"
  end
  
  def print_students_list
    print_count = 1
    while print_count <= 1 do
      print_count += 1
      cohorts = @students.map { |p| p[:cohort] }.uniq
      #maps the "students" array - each element a hash -, designates each hash 'p', 
      #takes each hash and calls the value of the cohort key 
      # .uniqs them so there aren't doubles and puts them in an array called "cohorts". So an order is set.
      cohorts.each do |x|
        # goes through the new array "cohorts" and designates each month as X  
      temp_students = @students.select { |p| p[:cohort] == x}
      # creates a new array "temp_students" then selects to go in it from 
      #the "students" array the hashes where cohort equals eg november, december then jan as per order from .uniq
      temp_students.each do |student|
        #temp_students is now an array filled with elements that are hashes 
        #in order of month. this designates each hash as "student" 
      # puts "#{student[:name]}".ljust(20) + "Hobby: #{student[:hobbies]}".ljust(25) + "Country of Birth: #{student[:country_of_birth]}".ljust(35) + "Height: #{student[:height]}".ljust(25) + "(#{student[:cohort]} cohort)".ljust(20)
    #then says print each "student" with these keys in a nice string.
    puts "#{student[:name]}".ljust(20) + "(#{student[:cohort]} cohort)".ljust(20)
    end  
    end  
    end
  end
  
  def print_footer
    puts "Overall, we have #{@students.count} great students"
  end


def save_students
  file = File.open("students.csv", "w")
@students.each do |student|
  student_data = [student[:name], student[:cohort]]
  csv_line = student_data.join(",")
  file.puts csv_line
end
file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, {filename} doesn't exist."
    exit
  end
  end


try_load_students
interactive_menu