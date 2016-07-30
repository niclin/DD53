class DeviseMailer < Devise::Mailer


  def confirmation_instructions(record, token, opts={})
    @team = record.teams.last
    super
  end

  def invitation_instructions(record, token, opts={})
  	@team = Team.find_by_domain(record.team)
    super
  end

end
