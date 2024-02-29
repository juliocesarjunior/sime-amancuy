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
require 'rails_helper'

RSpec.describe Archive, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
