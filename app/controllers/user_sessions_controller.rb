class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:notice] = "ログインしました"
      redirect_to root_path
    else
      flash.now[:alert] = "ログインに失敗しました"
      render :new
    end
  end

  def guest_login
    @guest_user = User.create(
    name: 'ゲスト',
    email: SecureRandom.alphanumeric(10) + "@email.com",
    password: 'password',
    password_confirmation: 'password'
    )
    auto_login(@guest_user)
    redirect_to root_path, success: 'ゲストとしてログインしました'
  end

  def destroy
    logout
    redirect_to login_path, status: :see_other
  end
end
