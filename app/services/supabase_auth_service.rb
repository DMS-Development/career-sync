require 'rest-client'
require 'json'

class SupabaseAuthService
  SIGNUP_URL = Figaro.env.SUPABASE_BASE_URL + Figaro.env.SUPABASE_SIGNUP_URL
  SUPABASE_KEY = Figaro.env.SUPABASE_PRIVATE_KEY

  def self.signup(params)
    response = RestClient.post(
      SIGNUP_URL,
      {
        email: params[:email],
        password: params[:password]
      }.to_json,
      headers = {
        content_type: :json,
        accept: :json,
        'apikey': SUPABASE_KEY
      }
    )

    json_response = JSON.parse(response.body)
  rescue RestClient::ExceptionWithResponse => e
    { error: e.response, detailed_error: e.message }
  end
end

