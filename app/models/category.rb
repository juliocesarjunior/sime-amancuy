# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  status      :integer          default("active")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
	audited

	enum status: { active: 0, inactive: 1, deleted: 2 }, _default: :active
	
	validates :name, presence: true

	def destroy
		self.update_attribute(:status, 2)
	end
end
