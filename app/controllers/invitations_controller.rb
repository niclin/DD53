class InvitationsController < Devise::InvitationsController
  def update
    if request.subdomain.present?
      team = Team.find_by_domain(request.subdomain)
      super
      team.users << resource
    end
  end
end
