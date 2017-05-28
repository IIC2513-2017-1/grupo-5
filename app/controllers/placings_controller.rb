class PlacingsController < ApplicationController
  def new; end

  def create
    @match_id = Match.find(params[:match_id])

  end
end
