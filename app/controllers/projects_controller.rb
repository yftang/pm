class ProjectsController < ApplicationController
  before_action :signed_in_user, only: [:get_projects, :create, :move,
                                        :resize, :edit, :update, :destroy]
  # before_action :correct_user,   only: [:show]

  def get_projects
    @projects = current_user.projects
    projects = []
    @projects.each do |project|
      projects << {
        :id          => project.id,
        :title       => project.acc,
        :description => project.description,
        :start       => project.start_date,
        :end         => project.dead_line,
        :color       => case project.status
                        when 'running'
                          'red'
                        when 'complete'
                          'green'
                        end
      }
    end
    render :text => projects.to_json
  end

  def search_project
    search_acc = params[:search_acc].strip
    search_result = Project.first(
        conditions: ["lower(acc) = ?", search_acc.downcase])
    if search_result
      project = {
        id:          search_result.id,
        acc:         search_result.acc,
        start_date:  search_result.start_date,
        description: search_result.description,
      }
      render :json => project.to_json
    else
      render :json => nil
    end
  end

  def show
    @project = Project.find(params[:id])

    if signed_in?
      # @user = current_user
      @users = @project.users
    end
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

  def move
    @project = Project.find_by_id(params[:id])
    if @project
      @project.start_date = params[:day_delta].to_i\
          .days.from_now(@project.start_date)
      @project.dead_line = params[:day_delta].to_i\
          .days.from_now(@project.dead_line)
      @project.save
    end
    render :nothing => true
  end

  def resize
    @project = Project.find_by_id(params[:id])
    if @project
      @project.dead_line = params[:day_delta].to_i\
          .days.from_now(@project.dead_line)
      @project.save
    end
    render :nothing => true
  end

  def edit
    @project = Project.find_by_id(params[:id])
    render :json => { :form => render_to_string(:partial => 'edit') }
  end

  def update
    @project = Project.find_by_id(params[:project][:id])
    @project.attributes = project_params
    @project.save
    flash[:success] = 'Project updated!'
    redirect_to root_path
  end

  def destroy
    @project = Project.find_by_id(params[:id])
    @project.destroy
    render :nothing => true
  end

  private

    def project_params
      params.require(:project).permit(
        [:acc, :start_date, :description, :assigner, :species, :status])
    end

    def correct_user
      project = Project.find(params[:id])
      redirect_to root_path unless project.users.include? current_user
    end
end
