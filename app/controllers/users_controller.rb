class UsersController < ApplicationController
    def my_portfolio
        @user = current_user
        @user_stocks = @user.stocks
    end
    
    def my_friends
        if current_user.present?
            @my_friends = current_user.try(:friends)
        end
    end
end