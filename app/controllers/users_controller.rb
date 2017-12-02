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
       @users = User.search(params[:search_param])
       if @users.nil?
           @message = "You have no friends with name or email #{params[:search_param]}"
       end
       render json: @message if @message.present?
       render json: @users
    end
end