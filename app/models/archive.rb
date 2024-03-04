# == Schema Information
#
# Table name: archives
#
#  id         :bigint           not null, primary key
#  file       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  song_id    :bigint           not null
#
# Indexes
#
#  index_archives_on_song_id  (song_id)
#
# Foreign Keys
#
#  fk_rails_...  (song_id => songs.id)
#
class Archive < ApplicationRecord
	audited

	belongs_to :song

	mount_uploader :file, FileUploader

end
