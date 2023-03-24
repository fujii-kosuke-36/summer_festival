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

  def destroy
    logout
    redirect_to login_path, status: :see_other 
  end

  # ユーザー登録のメソッド
def guest_login
    # ランダムな文字列を作成
    random_string = SecureRandom.alphanumeric(10)
    # メールアドレスを作成
    email = random_string + "@email.com"
    # ユーザー作成
    @guest_user = User.create(
    name: 'ゲスト',
    email: email,
    password: 'password',
    password_confirmation: 'password'
    )
    # 簡単ログイン
    auto_login(@guest_user)
    # ルートパスにリダイレクト
    redirect_to root_path
  end
end
