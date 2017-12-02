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
        if @users.blank?
          @message = "You have no friends with name or email #{params[:search_param]}"
        end
      end
      render partial: "friends/friends_search"
    end
end