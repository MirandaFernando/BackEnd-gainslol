class Api::BetsController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_bet, only: [:show, :update, :destroy]

  # GET /bets
  def index
    @bets = current_api_user.bets.all

    render json: @bets
  end

  # GET /bets/1
  def show
    render json: @bet
  end

  # POST /bets
  def create
    @bet = current_api_user.bets.new(bet_params)

    if @bet.save
      render json: @bet, status: :created, location: api_bet_url(@bet)
    else
      render json: @bet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bets/1
  def update
    if @bet.update(bet_params)
      render json: @bet
    else
      render json: @bet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bets/1
  def destroy
    @bet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet
      @bet = current_api_user.bets.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bet_params
      params.require(:bet).permit(:game_date, :league, :style, :winner, :loser, :result_bet, :input, :odd, :profit, :comment)
    end
end
