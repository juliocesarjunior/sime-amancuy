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
require 'rails_helper'

RSpec.describe Song, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
