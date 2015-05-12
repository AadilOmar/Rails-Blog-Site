class UsersController < ApplicationController

	def index
		@users = User.all
		puts "AT THE user INDEX"
	end

	def show
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path end

	def new
		puts 'user new'
		@user = User.new
	end

	def create
		#validation-> only if it doesnt exist, create the user 
		puts "______________________________"
		puts 'create new user'
		@user = User.new(user_params)
		puts @user.username
		puts @user.email
		puts @user.password
		if(@user.save)
			puts "SAVING"
			redirect_to articles_path
		else
			render 'new'
		end	
	end

	 private
	  def user_params
	    params.require(:user).permit(:email, :password, :username, :password_confirmation)
	  end

end
