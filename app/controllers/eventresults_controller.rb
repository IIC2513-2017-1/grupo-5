class EventresultsController < ApplicationController
  def new; end

  def create
    @event = Event.find(params[:event_id])
    @matches = Match.where(event_id: @event.id)
    @user = User.find(@event.user_id)
    render xlsx: 'create', template: '/eventresults/create.xlsx.axlsx', filename: "history.xlsx"
      #redirect_to root_path
  end
end
