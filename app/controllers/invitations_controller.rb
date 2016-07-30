class InvitationsController < Devise::InvitationsController
  def update
    if request.subdomain.present?
      binding.pry
      team = Team.find_by_domain(request.subdomain)
      super
      team.users << resource
    end
  end
end
