class Project < ActiveRecord::Base
	def self.iron_find(id)
		where(id: id).first
	end
	def self.clean_old
		
	where("created_at > ?", Date.current - 1.week).destroy_all
	end
end
