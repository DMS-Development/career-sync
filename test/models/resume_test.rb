# == Schema Information
#
# Table name: resumes
#
#  id          :uuid             not null, primary key
#  user_id     :uuid             not null
#  file_path   :string
#  file_name   :string
#  upload_date :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class ResumeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
