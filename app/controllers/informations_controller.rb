class InformationsController < ApplicationController
  def new; end

  def create
    @match = Match.find(params[:match_id])
    @event = Event.find(params[:event_id])
    @user = User.find(@event.user_id)
    @bets = Bet.where(match_id: @match.id)
    render xlsx: 'create', template: 'information/create', filename: "results.xlsx"
      #redirect_to root_path
  end
end
