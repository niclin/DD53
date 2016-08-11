class TeamsController < ApplicationController
  before_action :authenticate_user!

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team_user = @team.team_users.build
    @team_user.user_id = current_user.id

    if @team.save
      redirect_to new_user_session_url(:subdomain => @team.domain)
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :domain)
  end

end
