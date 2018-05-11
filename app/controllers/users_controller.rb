class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index,:show]
  
  def index
    @users=User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @taskposts = @user.taskposts.order("created_at desc").page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success]="新規登録しました"
      redirect_to @user
    else
      flash[:danger]="新規登録に失敗しました"
      render :new
    end
  end

  private
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url if @user != current_user
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end