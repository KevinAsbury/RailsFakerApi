class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1.json
  def show; end

  # POST /users.json
  def create
    @user = User.new(user_params)
    return unless @user.valid?

    @user.email.downcase!
    @user.confirmed = false
    @user.active = true

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_digest, :confirmed, :active)
  end
end
