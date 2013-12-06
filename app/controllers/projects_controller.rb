class ProjectsController < ApplicationController
  before_action :signed_in_user, only: [:show, :create, :destroy]
  before_action :correct_user,   only: [:show]

  def show
    @user = current_user
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.create(project_params)
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

    def correct_user
      project = Project.find(params[:id])
      redirect_to root_path unless project.users.include? current_user
    end
end
