class Phalange < ApplicationRecord
	audited

	enum status: { active: 0, inactive: 1, deleted: 2 }, _default: :active

	mount_uploader :image, ImageUploader

	validates :name, presence: true
	
	def destroy
		self.update_attribute(:status, 2)
	end
end
