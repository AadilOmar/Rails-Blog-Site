class FriendsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    # puts @user.readAttribute(:username)
    @friend = @user.friends.new
  end

  def index
    @user = User.find(params[:user_id])
    @friends = @user.friends
  end

  def create
    puts "creating"
    @user = User.find(params[:user_id])
    @friend = @user.friends.new(friend_params)
    User.all.each do |cur|
      if(cur.username==@friend.username)
        redirect_to user_friends_path(@user.id)
        @friend.save
        return
      end
    end
    render 'new'
  end

  def destroy
    puts "DSTROYING"
    @user = User.find(params[:user_id])
    @friend = @user.friends.find(params[:id])
    @friend.destroy
    redirect_to user_friends_path(params[:user_id]) 
  end

  
  private 
    def friend_params
      params.require(:friend).permit(:username)
    end 
end