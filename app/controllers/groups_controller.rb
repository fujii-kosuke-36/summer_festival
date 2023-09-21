class GroupsController < ApplicationController
    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_group, only: [:show, :edit, :update, :destroy]
    before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
    def index
      @groups = Group.all
      @user = User.find(current_user.id)
    end
  
    def show
      @user = User.find(current_user.id)
    end
  
    def new
      @group = Group.new
    end
  
    def create 
      @group = Group.new(group_params)
      @group.owner_id = current_user.id
      if @group.save
        redirect_to group_path(@group)
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @group.update(group_params)
        redirect_to group_path(@group)
      else
        render :edit
      end
    end
  
    private 
  
    def group_params
      params.require(:group).permit(:name, :introduction)
    end
  
    def set_group
      @group = Group.find(params[:id])
    end
  
    def ensure_correct_user
      if @group.owner_id != current_user.id
        redirect_to groups_path
      end
    end
  end
  
