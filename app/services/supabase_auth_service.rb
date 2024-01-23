require 'rest-client'
require 'json'

class SupabaseAuthService
  SIGNUP_URL = Figaro.env.SUPABASE_BASE_URL + Figaro.env.SUPABASE_SIGNUP_URL
  LOGIN_URL = Figaro.env.SUPABASE_BASE_URL + Figaro.env.SUPABASE_SIGNIN_URL
  SUPABASE_KEY = Figaro.env.SUPABASE_PRIVATE_KEY

  def self.signup(params)
    # if params[:phone].nil?
      response = RestClient.post(
        SIGNUP_URL,
        {
          email: params[:email],
          password: params[:password],
        }.to_json,
        headers = {
          content_type: :json,
          accept: :json,
          'apikey': SUPABASE_KEY
        }
      )
#     else
#       response = RestClient.post(
#         SIGNUP_URL,
#         {
#           phone: params[:phone],
#           password: params[:password],
#         }.to_json,
#         headers = {
#           content_type: :json,
#           accept: :json,
#           'apikey': SUPABASE_KEY
#         }
#       )
#     end

    json_response = JSON.parse(response.body)

  rescue RestClient::ExceptionWithResponse => e
    { error: e.response, detailed_error: e.message }
  end

  def self.login(params)
    response = RestClient.post(
      LOGIN_URL,
      {
        email: params[:email],
        password: params[:password],
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





