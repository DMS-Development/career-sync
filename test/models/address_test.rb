# == Schema Information
#
# Table name: addresses
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  street     :string
#  streetTwo  :string
#  city       :string
#  state      :string
#  country    :string
#  zip_code   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
