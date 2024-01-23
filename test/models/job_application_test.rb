# == Schema Information
#
# Table name: job_applications
#
#  id                 :uuid             not null, primary key
#  user_id            :uuid             not null
#  job_id             :uuid             not null
#  application_status :string
#  application_date   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require "test_helper"

class JobApplicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
