class Person < ActiveRecord::Base
	has_many :participations
	has_many :projects, through: :participations
	validates :name, presence: true
end
