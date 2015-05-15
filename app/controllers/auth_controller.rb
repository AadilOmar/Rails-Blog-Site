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
		puts @user.email
		puts "________________-------"
		puts @username

		puts @password
		User.all.each do |current|
			puts current.username
			#better way of doing this...
			if current.username == @user.username and current.password == @user.password
				puts "++++++"
				puts current.id
				# session[:user_id] = current.id
				# puts "okok"
				# puts session[:user_id] 
				# reset session
				# puts session[:user_id]
				
				redirect_to user_articles_path(current.id)
				return
			end
		end
		puts "username not found. Try again"		
		redirect_to login_path

	end

	private 
		def auth_params
			params.require(:user).permit(:username, :password, :email)
		end

end
