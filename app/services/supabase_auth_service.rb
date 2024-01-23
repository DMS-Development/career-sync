require 'rest-client'
require 'json'

class SupabaseAuthService
  SIGNUP_URL = Figaro.env.SUPABASE_BASE_URL + Figaro.env.SUPABASE_SIGNUP_URL
  LOGIN_URL = Figaro.env.SUPABASE_BASE_URL + Figaro.env.SUPABASE_SIGNIN_URL
  UPDATE_USER_URL = Figaro.env.SUPABASE_BASE_URL + Figaro.env.SUPABASE_UPDATE_USER_URL
  FORGOT_PASSWORD_URL = Figaro.env.SUPABASE_BASE_URL + Figaro.env.SUPABASE_FORGOT_PASSWORD_URL
  LOGOUT_URL = Figaro.env.SUPABASE_BASE_URL + Figaro.env.SUPABASE_LOGOUT_URL
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

  def self.forgot_password(email)
    response = RestClient.post(
      FORGOT_PASSWORD_URL,
      { email: email }.to_json,
      headers = {
        content_type: :json,
        accept: :json,
        'apikey': SUPABASE_KEY
      }
    )

    JSON.parse(response.body)

  rescue RestClient::ExceptionWithResponse => e
    { error: e.response, detailed_error: e.message }
  end

  def self.update_user(params, user_token)
    response = RestClient.put(
      UPDATE_USER_URL,
      params.to_json,
      headers = {
        content_type: :json,
        accept: :json,
        'apikey': SUPABASE_KEY,
        'Authorization': "#{user_token}"
      }
    )

    JSON.parse(response.body)

  rescue RestClient::ExceptionWithResponse => e
    { error: e.response, detailed_error: e.message }
  end

  def self.logout(user_token)
    response = RestClient.post(
      LOGOUT_URL,
      {}.to_json,
      headers = {
        content_type: :json,
        accept: :json,
        'apikey': SUPABASE_KEY,
        'Authorization': "#{user_token}"
      }
    )

    { code: response.code }

  rescue RestClient::ExceptionWithResponse => e
    { error: e.response, detailed_error: e.message }
  end

end



