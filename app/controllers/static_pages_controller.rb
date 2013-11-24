class StaticPagesController < ApplicationController
  def home
    @project = current_user.projects.build if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
