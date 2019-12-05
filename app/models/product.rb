class Product < ApplicationRecord
	has_many :appointments, :dependent => :delete_all
	has_many :categories, through: :appointments, :dependent => :delete_all
end
