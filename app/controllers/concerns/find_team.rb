module FindTeam
  extend ActiveSupport::Concern

  protected
  def find_this_team
    @team = current_user.teams.find_by_domain(request.host.split('.').first)

    if @team.blank? and !current_user.teams.empty?
      @team = current_user.teams.last
      redirect_to root_path(:subdomain => @team.domain)
      flash[:warning] = "登入錯誤的群組，自動導向至正確頁面。"
    end
  end
end
