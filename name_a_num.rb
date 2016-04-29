require_relative 'sum_function.rb'

def start
	get_name
	get_age
	get_fav_num
	display_message
end

def get_name
	puts "what is your name?"
	@name = gets.chomp
end

def get_age
	puts "hello #{@name}, what is your age?"
	@age = gets.chomp
end

def get_fav_num
	@fav_num = []
	puts "#{@name}, what are your three favorite numers?"
	3.times do 
		number = gets.chomp
		@fav_num << number.to_i
	end
end

def display_message
	sum = sum(@fav_num[0], @fav_num[1], @fav_num[2])
	
	if @age.to_i > sum
		puts "#{@name}, the sum of your favorite numbers is #{sum}, this is less than your age!"
	elsif @age.to_i < sum
		puts "#{@name}, the sum of your favorite numbers is #{sum}, this is greater than your age!"
	else
		puts "#{@name}, the sum of your favorite numbers is #{sum}, this is the same as your age!"
	end
end

start
