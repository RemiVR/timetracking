class PeopleController < ApplicationController
	def index
		@person = Person.order("created_at DESC").all
	end
	def new
		@person = Person.new
	end
	def create
		@person = Person.new person_params
		if @person.save
			redirect_to action: 'index', controller: 'people'
		else
			render 'new'
		end
	end
	private
	def person_params
		params.require(:person).permit(:name)
	end
end
