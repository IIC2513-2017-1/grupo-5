class InvitationsController < ApplicationController

  def index
    @invitations = Invitation.all
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    puts "User"
    puts @invitation.user_id
    puts "Event"
    puts @invitation.event_id
    @event = Event.where(id: @invitation.event_id).first

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to @event, notice: 'Invitation was successfully sended.' }
        format.json do
          render json: {invited_id: @invitation.user_id, invitee_id: current_user.id, event_id: @event.id, invitation_id: @invitation.id}
        end
      else
        format.html { redirect_to @event, notice: 'The invitation could not be sended.' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @invitation = Invitation.find(params[:id])
    @event = Event.where(id: @invitation.event_id).first
    @invitation.destroy
    respond_to do |format|
      format.html { redirect_to @event, notice: 'Invitation was successfully destroyed.' }
      format.json do
        render json: {uninvited_id: @invitation.user_id, invitee_id: current_user.id, event_id: @event.id, invitation_id: @invitation.id}
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def invitation_params
      params.permit(:event_id, :user_id)
    end
end
