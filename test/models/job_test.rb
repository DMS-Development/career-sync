# == Schema Information
#
# Table name: jobs
#
#  id           :uuid             not null, primary key
#  title        :string
#  description  :text
#  location     :string
#  posted_date  :datetime
#  closing_date :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
