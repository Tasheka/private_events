class InvitationsController < ApplicationController
    before_action :user_signed_in?

    def index
        @invitations = Invitation.all
    end

    def create
        @invitation =  Invitation.new(invitation_params)

        respond_to do |format|
            if @invitation.save
                format.html { redirect_to event_url(params[:id]), notice: "Invitation was successfully created." }
                format.json { render :show, status: :created, location: @invitation }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @invitation.errors, status: :unprocessable_entity }
            end
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
        params.require(:invitation).permit(:event_id, :attendee_id)
    end
end