class Api::TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update, :destroy]

  # GET /teams
  def index
    @teams = Team.all

    render json: @teams
  end

  # GET /teams/1
  def show
    render json: @team
  end

  # POST /teams
  def create
    @team = Team.new(team_params)
    if @team.save
      render json: @team, status: :created, location: api_team_url(@team)
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
  end

  def update_stats
    file = './public/2021_LoL_esports_match_data_from_OraclesElixir_20210627.csv'
    File.open(file).each do |row|
      row = row.split(",")
      next if row[0] == '"Team"'
  
      name = row[0].delete_prefix('"').delete_suffix('"') rescue row[0]
      wims = row[2].delete('""%').to_i rescue row[2]
      loses = row[3].delete('""%').to_i rescue row[3]
      firstTower = row[15].delete('""%').to_f rescue row[15]
      firstDrag = row[18].delete('""%').to_f rescue row[18]
      Team.create(name: name, league_id: 1 wims: wims, loses: loses, first_drag: firstDrag , first_tower: firstTower )
    end
    @teams = Team.all
    render json: @teams
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name, :league_id, :wims, :loses, :first_drag, :first_tower)
    end

end
