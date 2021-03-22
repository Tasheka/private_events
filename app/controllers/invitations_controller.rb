class InvitationsController < ApplicationController
    before_action :user_signed_in?

    def show
        @users = User.all
    end
    
    def new
        @invitation = Invitation.new
    end

    def create
        @username = invitation_params[:username]
        @user = User.where(username: @username).pluck(:user_id)
        @invitation = Invitation.new(attendee_id: @user)
        if @invitation.save
            redirect_to root_path
          else
            render 'new'
          end
    end
    

    def destroy
        @invitation.destroy
        respond_to do |format|
        format.html { redirect_to events_url, notice: "Invitation was successfully destroyed." }
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
        params.permit(:event_id, :attendee_id)
    end
end