require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

before do
	def check_guess(guess)

		if guess.to_i == 0
				""
			elsif guess.to_i == SECRET_NUMBER
				"You got it right! The SECRET NUMBER is #{SECRET_NUMBER}"
			elsif guess.to_i > (SECRET_NUMBER + 5)
				"Way too high!"
			elsif guess.to_i > SECRET_NUMBER
				"Too high!"
			elsif guess.to_i < (SECRET_NUMBER - 5)
				"Way too low!"		
			else guess.to_i < SECRET_NUMBER
				"Too low!"
			end
	end

	def background_color(message)
		if message == ""
			"white"
		elsif message == "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}"
			"green"			
		elsif message == "Way too high!" || message == "Way too low!"
			"red"
		else message == "Too high!" || message == "Too low!"
			"blue"
		end
	end
end

number = SECRET_NUMBER

get '/' do
	guess = params["guess"]
	message = check_guess(guess)
	color = background_color(message)
  erb :index, :locals => {:number => number, :message => message, :color => color}	
end

