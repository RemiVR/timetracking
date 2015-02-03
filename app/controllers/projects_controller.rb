class ProjectsController < ApplicationController
	def index
		@projects.last_created_projects
		# if @projects.empty?
		# 	render 'no_projects_found'
		# end
	end
	
	def show
		begin
			@show_project = Project.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render 'no_projects_found'
		end
	end
end
