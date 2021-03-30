# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :user_signed_in?, only: %i[index show]
  before_action :set_user, only: %i[show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @prev_events = current_user.events.upcoming_events
    @upcoming_events = current_user.events.past_events
  end

  private

  def user_params
    params.require(:user).permit(:email, :username)
  end

  def user_signed_in?
    if current_user
      true
    else
      redirect_to login_path
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
  

  def current_user
    User.find_by(id: cookies[:user_id])
  end

  def authenticate_user
    redirect_to login_path if current_user.nil?
  end
end
