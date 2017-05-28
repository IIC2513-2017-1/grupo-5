class PlacingsController < ApplicationController
  def new; end

  def create
    ## Find teams and bets
    @match = Match.find(params[:match_id])
    @teams = Team.joins(:participations).where(['participations.match_id = ?', @match.id]).order(placing: :asc)
    @bets = Bet.where(match_id: @match.id)
    coins = @bets.sum(:ammount)
    ## Close bets and distribute coins
    @bets.each do |bet|

      bet.bet_state = 1
      bet.save
    end
    ## Close match
    @match.state = 1
    @match.save
    redirect_to events_path(@match.event_id), notice: 'Match as succesfully closed and earnings were distributed'


  end
end
