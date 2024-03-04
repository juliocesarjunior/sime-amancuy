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
require 'rails_helper'

RSpec.describe Archive, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
