class Project < ActiveRecord::Base
	
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :name, length: {maximum: 30}
	validates :name, format: {with: /\A[a-zA-Z]/}
	validates :description, presence: true
	validates :description, length: {maximum: 30}

	has_attached_file :logo, styles: {:medium => "300x300>", :thumb => "60x60>"}
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

	has_many :entries

	has_many :participations
	has_many :people , through: :participations

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
