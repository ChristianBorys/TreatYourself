class Restaurant < ActiveRecord::Base

	belongs_to :owner
	validates :name, :address, :phone_number, presence: true
	validates :owner_id, presence: :true
end
