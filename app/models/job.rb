# == Schema Information
#
# Table name: jobs
#
#  id           :bigint           not null, primary key
#  title        :string
#  description  :text
#  location     :string
#  posted_date  :datetime
#  closing_date :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Job < ApplicationRecord
  has_many :job_applications
end
