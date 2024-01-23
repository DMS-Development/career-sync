# == Schema Information
#
# Table name: users
#
#  id           :uuid             not null, primary key
#  email        :string
#  role         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  phone_number :string
#
class User < ApplicationRecord
  has_one :profile
  has_one :address
  has_many :resumes
  has_many :job_applications

  validates :role, inclusion: { in: ['candidate', 'employer'], message: "%{value} is not a valid role" }

end
