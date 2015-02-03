class EntriesController < ApplicationController
	def index
		@project = Project.find params[:project_id]
		@entries = @project.entries
		@entries_by_month = @project.entries_by_month(2015, 2)
		total_hours = 0
		@entries_by_month.each {|entry| total_hours += entry.hours}
		@hours = total_hours
	end
end
