module FindTeam
  extend ActiveSupport::Concern

  protected
  def find_this_team
    @team = current_user.teams.find_by_domain(request.host.split('.').first)

    if @team.blank? and !current_user.teams.empty?
      @team = current_user.teams.last
      redirect_to root_url(:subdomain => @team.domain)
      flash[:warning] = "您登入到錯誤的群組，已自動導向原有群組。"
    end
  end
end
