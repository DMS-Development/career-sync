# == Schema Information
#
# Table name: resumes
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  file_path   :string
#  file_name   :string
#  upload_date :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Resume < ApplicationRecord
  belongs_to :user
end
