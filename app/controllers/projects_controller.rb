class ProjectsController < ApplicationController
	def home
	end
	def index
		@projects = Project.last_created_projects
	end
	
	def show
		begin
			@show_project = Project.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render 'no_projects_found'
		end
	end
	def new
		@project = Project.new
	end
	def create
		@project = Project.new project_params
		if @project.save
			redirect_to action: 'index', controller: 'projects', project_id: @project.id
		else
			render 'new'
		end
	end

	private
	def project_params
		params.require(:project).permit(:name, :description, :logo)
	end
end
