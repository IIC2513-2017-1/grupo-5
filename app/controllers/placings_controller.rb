class PlacingsController < ApplicationController
  def new; end

  def create
    ## Find teams and bets
    @match = Match.find(params[:match_id])
    @teams = Team.joins(:participations).where(['participations.match_id = ?', @match.id]).order(placing: :desc)
    @bets = Bet.where(match_id: @match.id)
    @coins = @bets.sum(:ammount)
    @places = Participations.where(match_id: @match.id).maximum(:placing)
    @total_places = Participations.where(match_id: @match.id).sum(:placing)
    @temp_money = @coins/@places

    for i in @places do
      @current_money = @temp_money * (@places - i)
      @winners = Bets.joins(:participations).where(['participations.team_id = bets.team_id AND participations.placing = ?', i+1])
      @winners_count = Bets.joins(:participations).where(['participations.team_id = bets.team_id AND participations.placing = ?', i+1]).count
      @winners.each do |winner|
        @user = User.find(winner.bets.user_id)
        BetsMailer.bets_mail(@user, @match, @current_money/@winners_count).deliver_later
        @user.update_attribute(:coins, @user.coins + @current_money/@winners_count)
        @bet = Bets.find(winner.bets.id)
        @bet.update_attribute(:state, 1)
      end
    end

    ## Close match
    @match.state = 1
    @match.save
    redirect_to events_path(@match.event_id), notice: 'Match as succesfully closed and earnings were distributed'
  end
end
