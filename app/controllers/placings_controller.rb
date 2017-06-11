class PlacingsController < ApplicationController
  def new; end

  def create
    ## Find teams and bets
    @match = Match.find(params[:match_id])
    @teams = Team.joins(:participations).where(['participations.match_id = ?', @match.id]).order(placing: :desc)
    @bets = Bet.where(match_id: @match.id)
    @coins = @bets.sum(:ammount)
    @places = Participation.where(match_id: @match.id).maximum(:placing)
    @total_places = Participation.where(match_id: @match.id).sum(:placing)
    @temp_money = @coins/@total_places

    for i in 0..@places do
      @current_money = @temp_money * (@places - i)
      @winner_team = Team.joins(:participations).where(['participations.match_id = ? AND participations.placing = ?', @match.id, i+1])
      @winners = Bet.where(team_id: @winner_team.ids, match_id: @match.id)
      @winners_count = @winners.count
      @winners.each do |winner|
        @user = User.find(winner.user_id)
        BetsMailer.bets_mail(@user, @match, @current_money/@winners_count).deliver_later
        @user.update_attribute(:coins, @user.coins + @current_money/@winners_count)
        winner.update_attribute(:bet_state, 1)
      end
    end

    ## Close match
    @match.state = 1
    @match.save
    redirect_to events_path(@match.event_id), notice: 'Match as succesfully closed and earnings were distributed'
  end
end
