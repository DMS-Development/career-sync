require 'rest-client'
require 'json'
require 'securerandom'

class SupabaseService
  BASE_URL = Figaro.env.SUPABASE_BASE_URL
  BUCKET_NAME = 'resumes'
  SUPABASE_KEY = Figaro.env.SUPABASE_PRIVATE_KEY

  def self.upload_resume(file)
    filename = file.respond_to?(:original_filename) ? file.original_filename : File.basename(file)

    extension = File.extname(filename)
    random_name = "#{SecureRandom.uuid}#{extension}"
    file_path = "#{random_name}"

    file_to_upload = file.respond_to?(:tempfile) ? file.tempfile : file

    url = "#{BASE_URL}/storage/v1/object/#{BUCKET_NAME}/#{file_path}"

    headers = {
      'Authorization' => "Bearer #{SUPABASE_KEY}"
    }

    response = RestClient.post(url, { file: File.new(file_to_upload, 'rb') }, headers)

    if response.code == 200
      response_body = JSON.parse(response.body)
      { key: response_body['Key'], id: response_body['Id'] }
    else
      nil
    end
  rescue RestClient::ExceptionWithResponse => e
    Rails.logger.error "Supabase upload failed #{e.response}"
    nil
  rescue => e
    Rails.logger.error "Supabase upload encountered an error #{e.message}"
    nil
  end
end
