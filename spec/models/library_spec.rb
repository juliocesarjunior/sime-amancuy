# == Schema Information
#
# Table name: libraries
#
#  id          :bigint           not null, primary key
#  description :text
#  file        :string
#  name        :string
#  status      :integer          default("active")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Library, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
