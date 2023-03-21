class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path, notice: 'ログインしました'
    else
      flash.now[:alert] = "ログインに失敗しました!!"
      render :new
    end
  end

  def destroy
    logout
    redirect_to login_path, status: :see_other 
  end

  def guest_login
    @guest_user = User.create(
    name: 'ゲスト',
    email: SecureRandom.alphanumeric(10) + "@email.com",
    password: 'password',
    password_confirmation: 'password'
    )
    auto_login(@guest_user)
    redirect_to root_path
  end
end
