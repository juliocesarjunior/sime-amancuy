# == Schema Information
#
# Table name: songs
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  song_type   :integer
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
FactoryBot.define do
  factory :song do
    
  end
end
