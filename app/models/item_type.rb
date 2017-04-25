class ItemType < ApplicationRecord
	has_many :items
	validates :code, length: { is: 3 }
end
