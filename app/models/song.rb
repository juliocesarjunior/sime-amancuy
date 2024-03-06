# == Schema Information
#
# Table name: songs
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  status      :integer          default("active")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  phalange_id :bigint
#
# Indexes
#
#  index_songs_on_phalange_id  (phalange_id)
#
# Foreign Keys
#
#  fk_rails_...  (phalange_id => phalanges.id)
#
class Song < ApplicationRecord
	audited
	
	after_initialize :build_default_archive

	enum status: { active: 0, inactive: 1, deleted: 2 }, _default: :active

	belongs_to :phalange, required: false

	has_many :archives
	accepts_nested_attributes_for :archives, allow_destroy: true

	def destroy
		self.update_attribute(:status, 2)
	end

	private
	def build_default_archive
		archives.build if archives.empty?
	end
end
