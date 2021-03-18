class UsersController < ApplicationController

    def index
      @users = User.all
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        render 'new'
      end
    end
  
    def show
      @upcoming_events = current_user.events.upcoming_events
      @past_events = current_user.events.past_events
    end

    private
    def user_params
      params.require(:user).permit(:email, :username)
    end
  end
  