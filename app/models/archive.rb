class Archive < ApplicationRecord
	belongs_to :fileable, polymorphic: true
end
