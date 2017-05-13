class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy]
  before_action :has_suf_money?, only: [:create]

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
    withdraw_coins
    respond_to do |format|
      if @bet.save
        format.html { redirect_to @bet, notice: 'Bet was successfully created.' }
        format.json { render :show, status: :created, location: @bet }
      else
        format.html { render :new }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bets/1
  # PATCH/PUT /bets/1.json
  def update
    respond_to do |format|
      if @bet.update(bet_params)
        format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
        format.json { render :show, status: :ok, location: @bet }
      else
        format.html { render :edit }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bets/1
  # DELETE /bets/1.json
  def destroy
    @bet.destroy
    respond_to do |format|
      format.html { redirect_to bets_url, notice: 'Bet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #Le quita los coins apostados al jugador
  def withdraw_coins
    @user = User.find(bet_params[:user_id])
    coins = @user.coins - Integer(bet_params[:ammount])
    @user.update_attribute(:coins, coins)
  end

  def has_suf_money?
    @user = User.find(bet_params[:user_id])
    if @user.coins < Integer(bet_params[:ammount])
      return false
    end
    return true
  end

  #Recalcula los coins apostados en un update al jugador
  def recalculate_coins
    @user = User.find(bet_params[:user_id])
    coins = @user.coins - Integer(bet_params[:ammount]) + @bet.ammount
    @user.update_attribute(:coins, coins)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_bet
      @bet = Bet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_params
      params.require(:bet).permit(:ammount, :bet_state, :match_id, :user_id, :team_id)
    end
end
