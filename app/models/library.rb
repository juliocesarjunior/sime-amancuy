# == Schema Information
#
# Table name: libraries
#
#  id          :bigint           not null, primary key
#  description :text
#  file        :string
#  name        :string
#  status      :integer          default("active")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Library < ApplicationRecord
	audited

	enum status: { active: 0, inactive: 1, deleted: 2 }, _default: :active

	validates :name, :description, :file, presence: true
	mount_uploader :file, FileUploader

	def destroy
		self.update_attribute(:status, 2)
	end

	private
	def build_default_archive
		archives.build if archives.empty?
	end
end
