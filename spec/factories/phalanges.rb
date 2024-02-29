# == Schema Information
#
# Table name: phalanges
#
#  id          :bigint           not null, primary key
#  description :text
#  image       :string
#  name        :string
#  order       :integer
#  status      :integer          default("active")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :phalange do
    
  end
end
