class ProjectsController < ApplicationController
	def index
		@projects = Project.last_created_projects
	end
	def show
		@show_project = Project.find(params[:id])
	end
end
