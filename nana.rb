require 'sinatra'

enable :sessions

get '/' do 
	erb :get_name
end

post '/input' do
	session[:name] = params[:user_name]
	erb :get_age, :locals => {:name => session[:name] = params[:user_name]}
end

post '/age' do
	session[:age] = params[:user_age]
	erb :get_fav_num, :locals => {:age => session[:age], :name => session[:name]}
end

post '/fav_nums' do
	fav_num1 = params[:user_fav_num1]
	fav_num2 = params[:user_fav_num2]
	fav_num3 = params[:user_fav_num3]
	sum = fav_num1.to_i + fav_num2.to_i + fav_num3.to_i
	if sum < session[:age].to_i
		erb:sum_num, :locals => {:sum => sum, :fav1 => fav_num1, :fav2 => fav_num2, :fav3 => fav_num3, :result => "the sum is less than your age.. :(", :name => session[:name]} 
	elsif sum > session[:age].to_i
		erb:sum_num, :locals => {:sum => sum, :fav1 => fav_num1, :fav2 => fav_num2, :fav3 => fav_num3, :result => "the sum is greater than your age! :)", :name => session[:name]}
	else
		erb:sum_num, :locals => {:sum => sum, :fav1 => fav_num1, :fav2 => fav_num2, :fav3 => fav_num3, :result => "the sum is equal to your age. :|", :name => session[:name]}
	end
end
