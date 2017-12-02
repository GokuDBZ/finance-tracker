class UsersController < ApplicationController
    def my_portfolio
        @user = current_user
        @user_stocks = @user.stocks
    end
    
    def my_friends
        if current_user.present?
            @friendships = current_user.try(:friends)
        end
    end
    
    def search
      if params[:search_param].blank?
        flash.now[:error] = "please enter any name"
      else
        @users = User.search(params[:search_param])
        @users = current_user.except_current_user(@users) if @users.present?
        if @users.blank?
          @message = "You have no friends with name or email #{params[:search_param]}"
        end
      end
      render partial: "friends/friends_search"
    end
    
    def add_friend
      @friendship = Friendship.new({user_id: params[:user], friend_id: params[:friend]})
      if @friendship.save
        flash[:friend_added] = "#{@friendship.friend.first_name || @friendship.friend.email} got added as friend" 
        redirect_to my_friends_path
      else
        
      end
    end
    
    def remove_friend
      @friendship = Friendship.where(user_id: params[:user_id], friend_id: params[:friend_id]).first
      friend = @friendship.friend if @friendship.present?
      
      if @friendship.delete
        flash[:friendship_removed] = "#{friend.first_name || friend.email} got removed from friends list"
        redirect_to my_friends_path
      else
      end
    end
end