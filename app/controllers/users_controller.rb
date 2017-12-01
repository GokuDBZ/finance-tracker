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
        @users = User.search(params[:to_search])
    end
end