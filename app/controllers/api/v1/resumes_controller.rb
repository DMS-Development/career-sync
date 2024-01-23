class Api::V1::ResumesController < ApplicationController
  def create
    resume = Resume.new(resume_params)

    upload_response = SupabaseService.upload_resume(params[:file])

    if upload_response
      resume.file_name = upload_response[:id]
      resume.file_path = upload_response[:key] # Adjust according to your needs
    else
      # Handle upload failure
    end
  end

  def update
  end

  private

  def resume_params
    # Define strong parameters for resume
    params.require(:resume).permit(:user_id, :upload_date)
  end
end
