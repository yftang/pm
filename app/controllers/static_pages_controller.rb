class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @project = current_user.projects.build
      @auth_token = form_authenticity_token
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
