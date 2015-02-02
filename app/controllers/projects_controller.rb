class ProjectsController < ApplicationController
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
end
