class TaskpostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy,:update]

  def create
    @taskpost = current_user.taskposts.build(taskpost_params)
    if @taskpost.save
      flash[:success] = "タスクを登録しました"
      redirect_to root_url
    else
      @taskposts = current_user.microposts.order("created_at desc").page(params[:page])
      render "toppages/index"
    end
  end

  def destroy
    @taskpost.destroy
    flash[:success]= "タスクを削除しました"
    redirect_to root_url
  end
  
  def edit
    @taskpost = Taskpost.find(params[:id])
  end
  
  def update
    if @taskpost.update(taskpost_params)
      flash[:success] = "タスクは正常に更新されました"
      redirect_to root_url
    else
      flash.now[:danger] = "タスクは更新されませんでした"
      render root_url
    end
  end
  
  def show
    @taskpost = Taskpost.find(params[:id])
  end
  
  def edit
    @taskpost = Taskpost.find(params[:id])
  end
  
  private
  
  def taskpost_params
    params.require(:taskpost).permit(:content)
  end
  
  def correct_user
    @taskpost = current_user.taskposts.find_by(id: params[:id])
    unless @taskpost
      redirect_to root_url
    end
  end
  
end
