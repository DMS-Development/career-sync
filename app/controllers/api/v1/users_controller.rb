class Api::V1::UsersController < ApplicationController
  def login
    response = SupabaseAuthService.login(login_params)

    if response[:error]
      render json: { error: response[:error], detailed_error: response[:detailed_error] }, status: :unprocessable_entity
    else
      render json: { message: 'User logged in successfully', user: response }, status: :ok
    end
  end

  def forgot_password
    response = SupabaseAuthService.forgot_password(forgot_password_params[:email])

    if response[:error]
      render json: { error: response[:error], detailed_error: response[:detailed_error] }, status: :unprocessable_entity
    else
      render json: { message: 'Password reset email sent successfully', user: response }, status: :ok
    end
  end

  def create
    signup_result = SupabaseAuthService.signup(allowed_user_params)

    if signup_result[:error]
      render json: { error: signup_result[:error], detailed_error: signup_result[:detailed_error] }, status: :unprocessable_entity
      return
    end

    user_params = allowed_user_params.to_h.except('password')
    user_params['id'] = signup_result['id']

    @user = User.new(user_params)

    if @user.save
      render json: { message: 'User created successfully', user: @user }, status: :created
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    token = request.headers['Authorization']
    response = SupabaseAuthService.update_user(user_update_params, token)

    if response[:error]
      render json: { error: response[:error], detailed_error: response[:detailed_error] }, status: :unprocessable_entity
    else
      render json: { message: 'User updated successfully', user: response }, status: :ok
    end
  end

  def logout
    token = request.headers['Authorization']
    response = SupabaseAuthService.logout(token)

    if response[:error] || response[:code] >= 400
      # considering a status code of >= 400 as an error
      render json: { error: response[:error], detailed_error: response[:detailed_error] }, status: :unprocessable_entity
    else
      render json: { message: 'User logged out successfully', user: response }, status: :ok
    end
  end

  def destroy
  end

  private

  def allowed_user_params
    params.require(:user).permit(:email, :password, :role, :phone)
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end

  def user_update_params
    params.require(:user).permit(:email, :password, :phone)
  end

  def forgot_password_params
    params.require(:user).permit(:email)
  end

end



