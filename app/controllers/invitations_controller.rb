# frozen_string_literal: true

class InvitationsController < ApplicationController
  before_action :user_signed_in?

  def index
    @users = User.all
  end

  def new
    @invitation = Invitation.new
    @event = params[:event_id]
  end

  def create
    @email = invitation_params[:email]
    @user = User.where(email: @email).pluck(:id)
    @invitation = Invitation.new(attendee_id: @user, event_id: invitation_params[:event_id],
                                 email: invitation_params[:email])
    if @invitation.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @invitation.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Invitation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

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

  def invitation_params
    params.permit(:id, :email, :authenticity_token, :commit, :event_id)
  end
end
