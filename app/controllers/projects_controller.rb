class ProjectsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  
  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  def destroy
  end
  
  private
  
    def project_params
      params.require(:project).permit([:acc, :start_date, :dead_line])
    end
end
