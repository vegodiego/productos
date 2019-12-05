class Category < ApplicationRecord
	has_many :appointments, :dependent => :delete_all
	has_many :products, through: :appointments, :dependent => :delete_all
end
