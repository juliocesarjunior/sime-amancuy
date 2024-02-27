class Archive < ApplicationRecord
	audited

	belongs_to :fileable, polymorphic: true

	validates_uniqueness_of :fileable_id, scope: :fileable_type


	def destroy
		self.update_attribute(:status, 2)
	end
end
