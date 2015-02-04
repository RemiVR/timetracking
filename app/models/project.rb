class Project < ActiveRecord::Base
	
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :name, length: {maximum: 30}
	validates :name, format: {with: /\A[0-9]/}

	has_many :entries

	def self.iron_find(id)
		where(id: id).first
	end
	def self.clean_old
		
	where("created_at > ?", Date.current - 1.week).destroy_all
	end
	def self.last_created_projects
		order("created_at DESC").limit(10)
	end
	def entries_of_last_month
		entries_by_month(Date.today.year, Date.today.month)
	end
	def entries_by_month(year, month)
		from = Date.new(year, month, 1)
		to = Date.new(year, month, -1)
		entries.where(created_at: from..to)
	end
end
