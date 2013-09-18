class Restaurant < ActiveRecord::Base

	validates :name, :address, :phone_number, presence: true
end
