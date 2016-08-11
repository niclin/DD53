class PagesController < ApplicationController

  layout 'landingpage', only: [:welcome]

  def welcome
  end

  def signin

  end

  def switch_domain
    @team = Team.find_by_domain(params[:domain])

    if @team.present?
      redirect_to root_url(:subdomain => @team.domain)
    else
      render :text => "Team is not exist"
    end

  end

end
