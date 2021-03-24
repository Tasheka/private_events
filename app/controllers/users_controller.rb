class UsersController < ApplicationController
  before_action :user_signed_in?, only: %i[index show]

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
    @user = User.find(params[:id])
    @users = User.all
    @events = Event.where(user_id: params[:id])
    @invites = Invitation.where(attendee_id: params[:id])
    @past_invites = []
    @upcoming_invites = []

    @events.each do |event|
      @invites.each do |invite|
        if event.date < invite.created_at 
          @past_events << invite
        else
          @upcoming_events << invite
      end
    end
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

  def current_user
    User.find_by(id: cookies[:user_id])
  end

  def authenticate_user
    redirect_to login_path if current_user.nil?
  end
end
  