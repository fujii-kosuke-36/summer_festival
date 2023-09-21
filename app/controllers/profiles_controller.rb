class ProfilesController < ApplicationController
    before_action :require_login
    before_action :set_user, only: [:show, :edit, :update]

    def show
        @answers = @user.answers.includes(:artist).order(created_at: :desc)
        @bookmarks = @user.bookmarks.includes(:answer => :artist).order("bookmarks.created_at DESC").page(params[:page]).per(8)
      end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to profile_path(@user)
        else
            render :edit
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email)
    end

    def set_user
        @user = User.find(current_user.id)
    end
end