class Admin::TeamsController < AdminController
  include Pagination

  before_action :set_team, only: %i[edit update destroy show]

  # GET /teams
  def index
    pagination = PaginationService.call(
      cursor: Team.includes(:user),
      current_page:,
      per_page:,
      path: 'admin_teams_path'
    )

    @teams = pagination[:cursor]
    @options = pagination[:options]
  end

  # GET /teams/new
  def new
    @team = Team.new(id: nil)
  end

  # GET /teams/1/edit
  def edit; end

  # POST /teams
  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to admin_team_path(@team), notice: 'Team was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  rescue => e
    flash[:error] = e.message
    render :new, status: :unprocessable_entity
  end

  # GET /teams/1
  def show; end

  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      redirect_to admin_team_path(@team), notice: 'Team was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  rescue => e
    flash[:error] = e.message
    render :edit, status: :unprocessable_entity
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
    redirect_to admin_teams_path, notice: 'Team admin was successfully destroyed.'
  rescue => e
    flash[:error] = e.message
    redirect_to admin_team_path(@team)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.includes(collaborators: %i[user], invites: %i[sender recipient]).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def team_params
    params.require(:team).permit!
  end
end
