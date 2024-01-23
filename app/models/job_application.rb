# == Schema Information
#
# Table name: job_applications
#
#  id                 :bigint           not null, primary key
#  user_id            :bigint           not null
#  job_id             :bigint           not null
#  application_status :string
#  application_date   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job
end
