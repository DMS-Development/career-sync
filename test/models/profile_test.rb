# == Schema Information
#
# Table name: profiles
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
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
