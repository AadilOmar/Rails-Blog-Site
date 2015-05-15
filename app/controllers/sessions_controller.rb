class SessionsController < ApplicationController

  def create
    #if authenticated, create session
    if authenticate(session_params[:username], session_params[:password])
      session[:user_id] = User.find_by(username: params[:session][:username]).id.to_s
      session[:username] = params[:session][:username]
      puts session[:username]
      puts session[:user_id]
      redirect_to user_articles_path(session[:user_id])
    else
      render 'new'      
    end
  end


  def destroy
    puts "Destroying session!!!"
    reset_session
    redirect_to root_path
  end

  def new
    #called when 'login' button is clicked
    reset_session
  end

  private
    def session_params
      params.require(:session).permit(:password, :username)
    end

    def authenticate(username, password)
      @thing = User.all.find_by(username: username)
      if(@thing && @thing.password != password)
        @thing= nil
      end 
      puts @thing
      puts username
      puts password
      puts "+++++++++++++"
      return @thing
    end
end