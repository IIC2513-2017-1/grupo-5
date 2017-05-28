class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy, :return_coins]

  # GET /bets
  # GET /bets.json
  def index
    @bets = Bet.all
  end

  # GET /bets/1
  # GET /bets/1.json
  def show
  end

  # GET /bets/new
  def new
    @bet = Bet.new
  end

  # GET /bets/1/edit
  def edit
  end

  # POST /bets
  # POST /bets.json
  def create
    @bet = Bet.new(bet_params)
    @user = User.find(@bet.user_id)
    respond_to do |format|
      if @bet.save
        format.html { redirect_to match_path(@bet.match_id), notice: 'Bet was successfully created.' }
        format.json { render :show, status: :created, location: @bet }
      else
        format.html { redirect_to match_path(@bet.match_id), notice: 'There was an error with the bet' }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
      end
  end

  # PATCH/PUT /bets/1
  # PATCH/PUT /bets/1.json
  def update
    respond_to do |format|
      if @bet.update(bet_params)
        format.html { redirect_to match_path(@bet.match_id), notice: 'Bet was successfully updated.' }
        format.json { render :show, status: :ok, location: @bet }
      else
        format.html { redirect_to match_path(@bet.match_id), notice: 'There was an error with the bet' }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bets/1
  # DELETE /bets/1.json
  def destroy
    @user = User.where(id: @bet.user_id).first
    coins = @user.coins + @bet.ammount
    @user.update_attribute(:coins, coins)
    @bet.destroy
    respond_to do |format|
      format.html { redirect_to user_url(@user.id), notice: 'Bet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_bet
      @bet = Bet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_params
      params.require(:bet).permit(:ammount, :match_id, :team_id).merge(bet_state: 0, user_id: current_user.id)
    end
end
