class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]
  # REGISTER
  def create
    return unless validate_user_creation_params

    # Create a new user
    @user = User.create(user_creation_params)
      render json: { user: @user, token: }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(
      :username,
      :password,
      :nickname,
      :favorite_verse,
      :email,
      profile_pictures: []
    )
  end

  def user_creation_params
    params
      .require(
        :username,
        :password,
        :email
      )
      .permit(
        :nickname
      )
  end

  def validate_user_creation_params
    # Ensure that either email or phone number is provided
    if params[:email].nil?
      render json: { error: 'Email required' }
      return false
    end
    # Check if user if already exists
    if User.find_by(username: params[:username])
      render json: { error: 'Username already exists' }
      return false
    end
    if User.find_by(email: params[:email])
      render json: { error: 'Email already exists' }
      return false
    end
    if User.find_by(phone: params[:phone])
      render json: { error: 'Phone number already exists' }
      return false
    end
    true
  end
end
