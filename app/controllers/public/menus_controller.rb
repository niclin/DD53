class Public::MenusController < ApplicationController

  layout 'team'

  def index
    @menus = Menu.where(is_public: true)
  end

  def clone
    @menu = Menu.find(params[:menu_id])

    if current_team.menus.include?(@menu)
      flash[:warning] = "你已經是擁有這張菜單了"
      redirect_to :back
    else
      if current_team.menus.exists?(title: @menu.title, phone: @menu.phone, address: @menu.address)
        flash[:warning] = "你已經是擁有這張菜單了"
        redirect_to :back
      else
        m = Menu.new(@menu.attributes.merge(:id => nil, :slug => nil, :team_id => current_team.id, :is_public => false))
        m.save
        redirect_to :back
        flash[:warning] = "已將#{@menu.title}加入菜單。"
      end
    end

  end
end
