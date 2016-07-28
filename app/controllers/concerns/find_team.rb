module FindTeam
  extend ActiveSupport::Concern
  protected


  def find_this_team

    @team = current_user.teams.find_by_domain(request.host.split('.').first)
    # make sure with domain
  end
end
