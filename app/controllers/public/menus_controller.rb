class Public::MenusController < ApplicationController

  layout 'team'

  def index
    @menus = Menu.where(is_public: true)
  end

end
