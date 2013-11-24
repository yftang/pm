class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @project = current_user.projects.build
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
