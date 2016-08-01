module FindTeam
  extend ActiveSupport::Concern

  protected
  def find_this_team
    @team = current_user.teams.find_by_domain(request.host.split('.').first)
    #不是群組的人請你滾回自己的群組
    if @team.blank? and !current_user.teams.empty?
      redirect_to signout_path(:subdomain => false)
      flash[:warning] = "登入錯誤的群組"
    end
  end
end