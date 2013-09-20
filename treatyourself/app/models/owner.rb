class Owner < ActiveRecord::Base

	has_many :restaurants, dependent: :destroy
	has_secure_password
	validates_presence_of :password, on: :create
	
end

