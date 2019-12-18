class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_current_user, only: [:show]
  before_action :logined_user, only: [:new]
  # GET /users
  def index
    @users = User.select(:id, :name, :email, :password_digest, :created_at, :password, :password_confirmation, :admin)
  end

  # GET /users/1
  def show

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_path notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
    end

    def logined_user
      if logged_in? == true
        redirect_to tasks_path
        flash[:danger] = "ログイン中はユーザー登録できません。"
      else
      end
    end

    def ensure_current_user
      if logged_in? == false
        redirect_to new_session_path
        flash[:danger] = "ログインしてください"
      elsif current_user.id != params[:id].to_i
        redirect_to tasks_path
      end
    end
end
