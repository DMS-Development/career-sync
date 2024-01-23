class Api::V1::UsersController < ApplicationController
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
end

def update
end

def destroy
end

private

def allowed_user_params
  params.require(:user).permit(:email, :password, :role, :phone)
end