# == Schema Information
#
# Table name: archives
#
#  id            :bigint           not null, primary key
#  file          :string
#  fileable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  fileable_id   :integer
#
class Archive < ApplicationRecord
	audited

	belongs_to :fileable, polymorphic: true
	validates_uniqueness_of :fileable_id, scope: :fileable_type
	mount_uploader :file, FileUploader

end
