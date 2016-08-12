class User::RegistrationsController < Devise::RegistrationsController
  layout 'team', only: [:edit]

  def new
    build_resource({})
    t = self.resource.teams.build
    respond_with self.resource
  end

  def create
    super
    resource.is_admin = true
    resource.save
  end

  def edit
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :teams_attributes => [ :name, :domain ])
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :current_password, :password, :password_confirmation)
  end
end
