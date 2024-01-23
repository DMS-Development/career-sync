# == Schema Information
#
# Table name: profiles
#
#  id           :uuid             not null, primary key
#  user_id      :uuid             not null
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  educations   :json
#  experiences  :json
#  skills       :json
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
