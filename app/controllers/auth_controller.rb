class AuthController < ApplicationController

	def create
		puts 'creating auth'
	end
	
	def register
		puts "registering"
	end

	def login
		puts "logging in"
		@user = User.new
	end

	def logout

	end

	def authenticate
		puts 'authenticating'
		@user = User.new(auth_params)
		puts @user.password
		puts @user.username

		puts @username
		puts @password
		User.all.each do |current|
			puts current.username
			if current.username == @user.username and current.password == @user.password
				puts "found user. Logging in"
				redirect_to articles_path
				return
			end
		end
		# if @users.include?(@user)
		# 	puts 'login successful'
		# else
		# 	puts 'incorrect login'
		puts "username not found. Try again"		
		redirect_to login_path

		# end
	end

	private 
		def auth_params
			params.require(:user).permit(:username, :password)
		end

end
