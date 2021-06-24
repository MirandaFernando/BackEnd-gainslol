class Api::BetsController < ApplicationController
  before_action :authenticate_api_user!

  # GET /bets
  def index
    @bets = current_api_user.bets.all
    render json: @bets
  end

  # GET /bets/1
  def show
    @bet = current_api_user.bets.find(params[:id])
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
    @bet = current_api_user.bets.find(params[:id])
    
    if @bet.update(bet_params)
      render json: @bet
    else
      render json: @bet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bets/1
  def destroy
    @bet = current_api_user.bets.find(params[:id])
    if @bet.present?
      @bet.destroy
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def bet_params
      params.require(:bet).permit(:game_date, :league, :style, :winner, :loser, :result_bet, :input, :odd, :profit, :comment)
    end
end
