class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params['user'][:email])
    @user = @user.authenticate(params['user'][:password])

    return render json: { status: 401 } unless @user && @user.active

    log_in(@user)

    render json: {
      status: :created,
      logged_in: true,
      user: {
        id: @user.id,
        email: @user.email
      }
    }
  end

  def destroy
    log_out
    redirect_to '/'
  end
end
