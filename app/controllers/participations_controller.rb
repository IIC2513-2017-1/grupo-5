class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy]

  def index
    @participations = Participation.all
  end

  def show
  end

  def new
    @participation = Participation.new
  end

  def edit
  end

  def create
    @participation = Participation.new(participation_params)
    @match = Match.where(id: @participation.match_id).first

    respond_to do |format|
      if @participation.save
        format.html { redirect_to @match, notice: 'Participation was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { redirect_to @match, notice: 'The team could not be added.' }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @match = Match.where(id: @participation.match_id).first
    respond_to do |format|
      if @participation.update(participation_params)
        format.html { redirect_to @match, notice: 'Participation was successfully updated.' }
        format.json { render :show, status: :ok, location: @participation }
      else
        format.html { render :edit }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @participation = Participation.find(params[:id])
    @match = Match.where(id: @participation.match_id).first
    @participation.destroy
    respond_to do |format|
      format.html { redirect_to @match, notice: 'Participation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      @participation = Participation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participation_params
      defaults = {placing: -1}
      params.require(:participation).permit(:match_id, :team_id, :placing).reverse_merge(defaults)
    end
end
