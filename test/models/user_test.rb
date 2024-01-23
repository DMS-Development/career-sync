# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  email      :string
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  phone      :string
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
