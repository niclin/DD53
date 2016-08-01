class User::InvitationsController < Devise::InvitationsController
  def update
    if request.subdomain.present?
      team = Team.find_by_domain(request.subdomain)
      super
      team.users << resource
      resource.is_admin = true
    end
  end
end
