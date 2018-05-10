class TaskpostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
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
    redirect_back(fallback_location: root_path)
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
