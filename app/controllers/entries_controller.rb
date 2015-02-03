class EntriesController < ApplicationController
	def index
		@project = Project.find params[:project_id]
		@entries = @project.entries
		@entries_by_month = @project.entries_by_month(2015, 2)
	end
end
