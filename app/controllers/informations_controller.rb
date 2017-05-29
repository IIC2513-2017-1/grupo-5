class InformationsController < ApplicationController
  def new; end

  def create
    @match = Match.find(params[:match_id])
    @event = Event.find(params[:event_id])
    @user = User.find(@event.user_id)
    @bets = Bet.where(match_id: @match.id).includes(:user, :team)
    @winner = Team.joins(:participations).where(['participations.match_id = ? AND participations.placing = ?', @match.id, 1]).first
    render xlsx: 'create', template: '/informations/create.xlsx.axlsx', filename: "history.xlsx"
      #redirect_to root_path
  end
end
