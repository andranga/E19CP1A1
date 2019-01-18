class TasksController < ApplicationController
  before_action :authenticate_user!
  
  def create
  	@project = Project.find(params[:project_id])
  	@task = Task.new(project: @project, user: current_user)
  	if @task.save
  		redirect_to projects_path, notice: 'La asignación fue satisfactoria'
  	else
  		redirect_to projects_path, alert: 'La asignación no se ha podido realizar'
  	end
  end

  def index
    @tasks = current_user.tasks 
  end
end

