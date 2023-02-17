class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to_root_path
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  def guest_login
    @guest_user = User.create(
    name: 'ゲスト',
    age: '**',
    email: SecureRandom.alphanumeric(10) + "@email.com",
    password: 'password',
    password_confirmation: 'password'
    )
    auto_login(@guest_user)
    redirect_to root_path, success: 'ゲストとしてログインしました'
  end
end
