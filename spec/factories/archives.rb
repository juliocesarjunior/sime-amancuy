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
FactoryBot.define do
  factory :archive do
    
  end
end
