class Admin::UsersController < ApplicationController
  before_action :admin_user_confirm
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :destroy_admin, only: [:destroy]

  def index
    @users = User.select(:id, :name, :email, :password_digest, :created_at, :password, :password_confirmation, :admin)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'Task was successfully destroyed.'
  end

  private
  def admin_user_confirm
    if logged_in? == false
      redirect_to new_session_path
      flash[:danger] = "ログインしてください"
    elsif current_user.admin? == false
    raise Forbidden
    flash[:danger] = "管理者権限がありません。"
    end
  end

  def destroy_admin
    if User.where(admin: :true).count <= 1
      redirect_to admin_users_path
      flash[:danger] = "これ以上管理者は削除できません"
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation, :admin)
  end
end
