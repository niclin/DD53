class DeviseMailer < Devise::Mailer

  def confirmation_instructions(record, token, opts={})
    @team = record.teams.last
    super
  end

end
