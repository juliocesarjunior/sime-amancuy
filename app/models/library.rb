# == Schema Information
#
# Table name: libraries
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  status      :integer          default("active")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Library < ApplicationRecord
	audited
	after_initialize :build_default_archive

	enum status: { active: 0, inactive: 1, deleted: 2 }, _default: :active

	has_many :archives, as: :fileable
	accepts_nested_attributes_for :archives, allow_destroy: true

	validates :name, :description, presence: true

	def destroy
		self.update_attribute(:status, 2)
	end

	private
	def build_default_archive
		archives.build if archives.empty?
	end
end
