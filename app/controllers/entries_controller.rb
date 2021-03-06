class EntriesController < ApplicationController
	def index
		@project = Project.find params[:project_id]
		@entries = @project.entries
		@entries_by_month = @project.entries_by_month(2015, 2)
		total_hours = 0
		@entries_by_month.each {|entry| total_hours += entry.hours}
		@hours = total_hours
	end
	def new
		@project = Project.find params[:project_id]
		@entry = @project.entries.new
	end
	def create
		@project = Project.find params[:project_id]
		@entry = @project.entries.new entry_params
		if @entry.save
			flash[:notice] = "Entry created successfully"
			redirect_to action: 'index', controller: 'entries', project_id: @project.id
		else
			render 'new'
		end
	end
	def edit
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]
	end
	def update
		@entry = Entry.find params[:id]
		if @entry.update_attributes entry_params
			redirect_to action: 'index', controller: 'entries'
		else
			render 'edit'
		end
	end
	def destroy
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]
		if @entry.destroy
			redirect_to action: 'index', controller: 'entries'
		end
	end
	private
	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date, :comments)
	end
end
