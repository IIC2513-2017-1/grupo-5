class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Login succesful.'
    else
      redirect_to(new_session_path, alert: 'Wrong credentials.')
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logout succesful.'

  end
end
