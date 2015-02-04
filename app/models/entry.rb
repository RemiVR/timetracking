class Entry < ActiveRecord::Base
	validates :hours, numericality: true
	validates :minutes, numericality: true
	belongs_to :project
end
