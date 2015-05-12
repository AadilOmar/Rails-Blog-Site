class AuthController < ApplicationController

	def create
		puts 'creating auth'
	end
	
	def register
		puts "registering"
	end

	def login
		puts "logging in"
	end

	def logout
	end

	def authenticate
		puts 'authenticating'
	  @user = User.find(params[:username])
	  puts params[:username]
	  puts @user.email
	  puts @user.password
	  puts @user.id
	  puts @user.username
		@users = User.all
		@users.each do |cur|
			if cur.username == @user.username
				puts "there already exists"
			else 
				puts "Username is unique"
			end	
		end
		# if @users.include?(@user)
		# 	puts 'login successful'
		redirect_to articles_path
		# else
		# 	puts 'incorrect login'

		# end
	end

	# private 
	# 	def auth_params
	# 		params.require(:user).permit(:username, :password)
	# 	end

end
